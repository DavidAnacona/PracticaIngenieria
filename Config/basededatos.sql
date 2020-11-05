create database bd_proyecto_academico;
USE bd_proyecto_academico;

create table Usuario
(
idUsuario int auto_increment,
User varchar(50),
Password varchar(8),
nombreUsuario varchar(50),
apellidoUsuario varchar(50),
tipoDocUsuario varchar(50),
docUsuario int,
estadoUsuario varchar(50),
tipoUsuario varchar(50),
idEspecialidad int,
Primary key(idUsuario)
);

insert into Usuario (User,Password,nombreUsuario,apellidoUsuario,tipoDocUsuario,DocUsuario,estadoUsuario,tipoUsuario,idEspecialidad) values 
("DanielAnacona","daniel@1","Daniel Felipe","Anacona Castellanos","T.I",1034656097,"Activo","Administrador",1),
("DavidAnacona","Santi22","David Santiago","Anacona Castellanos","T.I",1001329930,"Activo","Profesor",2),
("JersonLopez","jerson@2","Jerson Stiven","López Rodriguez","C.C", 6783142174,"activo" "profesor",3),
("CamilaMendez","camila@3","camila","Mendez Mejia","C.C",1024923892,"activo" "profesor",4),
("MiguelMacias","miguel@4","miguel Angel","macias Suárez","C.C", 1203186566,"activo" "profesor",5),
("AngieMonroy","angie@5","Angie Lorena","Monroy Puentes","C.C",1003547883,"activo","profesor",6),
("KarenRodriguez","karen@6","Karen Michel","Abril Diaz","C.C",1889027365,"activo","profesor",2),
("MaicolCardona","maicol@7","Maicol Javier","Cardona Mayorga","T.I",1001678854,"activo","estudiante",7),
("DiegoMonsalve","Diego@8","Diego Andrés","Monsalve Rios","T.I",1001657885,"activo","estudiante",7),
("LauraDoncel","Laura@9","Laura Sofia","Doncel Guzman","T.I",1001175558,"activo","administrador",1);

Select*from Usuario;

create table Inasistencia
(
idInasistencia int auto_increment,
idUsuario int,
fechaInasistencia date,
excusaInasistencia varchar (80),
idSeguimiento int,
primary key(idInasistencia)
);
insert into Inasistencia (idInasistencia,idUsuario,fechaInasistencia,excusaInasistencia,idSeguimiento) values 
(4,'02-05-20',"Enfermedad"),
(2,05/30/20,"CitaMedica"),
(3,18/09/20,"Fractura"),
(8,11/28/20,"Sancion",1),
(5,19/03/20,"Enfermedad"),
(9,20/06/20,"CitaMedica",2);

create table Observacion
(
idObservacion int auto_increment,
fechaObservacion date,
tipoFalta varchar(50),
descripcionObservacion varchar(100),
idUsuario int,
idSeguimiento int,
descargosObservacion varchar(100),
primary key(idObservacion)
);
insert into Observacion (idObservacion,fechaObservacion,tipoFalta,descripcionObservacion,idUsuario,idSeguimiento,descargosObservacion) values
('14-04-20',"Leves","El estudiante llega constantemente tarde a clase",8,1,"MaicolCardona","El estudiante presenta algunas excusas"),
('18-05-20',"Grave","El estudiante agredio a otro estudiante en el salon",9,2,"DiegoMonsalve","El estudiante fue sancionado y presento disculpas");

create table asignacionCarga
(
idAsignacion int auto_increment,
idMateria int,
idUsuario int,
idCurso int,
fechaAsignacion date,
primary key(idAsignacion)
);

insert into asignacionCarga (idAsignacion,idMateria,idUsuario,idCurso,fechaAsignacion) values
(1,2,1,'02-11-18'),
(2,3,2,'30-11-17'),
(3,4,3,'17-09-18'),
(4,5,4,'05-02-06'),
(5,6,5,'12-01-20');

create table Salon
(
idSalon int auto_increment,
nombreSalon varchar(50),
ubicacionSalon varchar(50),
primary key(idSalon)
);

insert into Salon (nombreSalon,ubicacionSalon) values
("MatematicasSecundaria","01B"),
("CienciasNaturalesSecundaria","02B"),
("CienciasPoliticasSecundaria","03B"),
("EspañolSecundaria","04B"),
("InglesSecundaria","05B");

create table Materia 
(
idMateria int auto_increment,
nombreMateria varchar(50),
horasSemanas int,
primary key(idMateria)
);
insert into Materia (idMateria,nombreMateria,horasSemanas) values
("Matematicas",4),
("CienciasNaturales",4),
("CienciasPoliticas",4),
("Español",4),
("ingles",4);

create table CargoUsuario 
(
idCargo int,
idUsuario int,
index(idCargo),
foreign key (idCargo) references Cargo(idCargo),
index(idUsuario),
foreign key (idUsuario) references Usuario(idUsuario)
);
insert into CargoUsuario (idCargo,idUsuario) values
(1,1),
(2,2),
(2,3),
(2,4),
(2,5),
(2,6),
(2,7),
(1,10);

Create table Cargo
(
idCargo int auto_increment,
nombreCargo varchar(50),
primary key(idCargo)
);
insert into Cargo (idCargo,nombreCargo) values
("administrador"),
("Profesor");

create table Calificacion
(
idCalificacion int auto_increment,
notaperiodo1 int,
notaperiodo2 int,
notaperiodo3 int,
notafinal int,
fechaRegistro date,
idCurso int,
idAsignacionCarga int,
primary key(idCalificacion)
);
insert into Calificacion (idCalificacion,notaperiodo1,notaperiodo2,notaperiodo3,notafinal,fecharegistro,idCurso,idAsignacionCarga) values
(30,50,40,120,'30-11-20',2,1);

create table curso
(
idCurso int auto_increment,
codigoCurso varchar(50),
primary key(idCurso)
);

insert into Curso (idCurso,CodigoCurso) values
("001B"),
("002B"),
("003B"),
("004B"),
("005B");

create table SeguimientoCurso
(
idSeguimiento int auto_increment,
idUsuario int,
idCurso int,
fechaSeguimiento date,
idSalon int,
primary key(idSeguimiento)
);
insert into SeguimientoCurso (idSeguimiento,idUsuario,idCurso.fechaSeguimiento,idSalon) values
(8,2,'07-07-20',2),
(9,4,'03-02-20',3);

create table especialidad 
(
idEspecialidad int auto_increment,
nombreEspecialidad varchar(50),
primary key(idEspecialidad)
);
insert into Cargo (idEspecialidad,nombreEspecialidad) values
("Administrador"),
("Matematicas"),
("CienciasNaturales"),
("CienciasPoliticas"),
("Español"),
("Ingles");

Alter table SeguimientoCurso ADD FOREIGN KEY (idSalon) References Salon(idSalon);
Alter table Observacion ADD FOREIGN KEY (idUsuario) References Usuario(idUsuario);
Alter table Observacion ADD FOREIGN KEY (idSeguimiento) References SeguimientoCurso(idSeguimiento);
alter table AsignacionCarga ADD FOREIGN KEY (idUsuario) References Usuario(idUsuario);
alter table AsignacionCarga ADD FOREIGN KEY (idMateria) References Materia(idMateria);
alter table AsignacionCarga ADD foreign key (idCurso) References Curso(idCurso);
alter table Inasistencia ADD FOREIGN KEY (idUsuario) References Usuario(idUsuario);
alter table Inasistencia ADD FOREIGN KEY (idSeguimiento) References SeguimientoCurso(IdSeguimiento);
alter table Calificacion ADD FOREIGN KEY (idAsignacionCarga) References AsignacionCarga(idAsignacion);
alter table Calificacion ADD FOREIGN KEY (idCurso) References Curso(idCurso);
alter table SeguimientoCurso ADD FOREIGN KEY (idUsuario) References Usuario(idUsuario); 
alter table SeguimientoCurso ADD FOREIGN KEY (idCurso) References Curso(idCurso);
Alter table Usuario ADD FOREIGN KEY (idEspecialidad) References especialidad(idEspecialidad);

select nombreUsuario, apellidoUsuario FROM Usuario