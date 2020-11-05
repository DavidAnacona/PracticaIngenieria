<?php
     $host = 'localhost';
     $user = 'root';
     $pass = '';
     $database = 'bd_academico';
     $charset = 'utf8';

     // 1. CONEXION A LA BASE DE DATOS DEL PROYECTO CONJUNTO CERRADO
     $con=new mysqli($host, $user, $pass, $database);
     $con->query("SET NAMES '".$charset."'");
	 if ($con->connect_errno) {
     	echo "<font color=red>";
        echo "<br>Fallo al conectar a MySQL: (" . $con->connect_errno . ") " . $con->connect_error;
        echo "</font>";
        exit;
     }
     else{
     	echo "<font color=blue><b>Conexión exitosa...</b></font>";
     }	

     $usuario= $_REQUEST["nombreusuario"];
     $contrasena= $_REQUEST["password"];

      if (isset($_REQUEST['nombreusuario']) && !empty($_REQUEST['nombreusuario']) && isset($_REQUEST['password']) && 
      	!empty($_REQUEST['password']))
      {               
		 echo "<br><br><b>Usuario: </b>". $usuario . "<br>";
		 echo "<b>Contrasena:</b> " . $contrasena . "<br>";
		 // 2. CONSULTA SELECT A TABLA USUARIOS PARA OBTENER EL TIPO DE USUARIO
         $query=$con->query("SELECT tipoUsuario FROM Usuario WHERE nombreUsuario='$usuario' and Password='$contrasena'");
         if($row = $query->fetch_object()) {
	      	echo "<br>Fila exitosamente encontrada!!!<br><br>";
           $tusuario = $row->tipoUsuario;
           echo "<br><b>Tipo de usuario:</b> " . $tusuario;	      	
            /*
            	3. REDIRECCIONAMIENTO A LA PÁGINA CON EL MENÚ ACORDE AL PERFIL DEL USUARIO
          		DETERMINA EL TIPO DE MENU A CARGAR PARA EL USUARIO
          	*/
            switch ($tusuario){
	            case 'Administrador':
    	            header ('location:  index.html');
                    break;
                case 'Profesor':
                    echo '<br>Esta a punto de cargar la página con el menú del vigilante...';
                    header ('location:  index2.html');
                    break;
                case 'Estudiante':
                	echo '<br>Esta a punto de cargar la página con el menú del residente...';
                    header ('location:  index3.html');
                    break;
                default:
                    echo "<br>No existe ese tipo de usuario en la base de datos";
                    break;
	     }
	     else{
 	      	echo "<br><font color=red>El usuario no existe en la base de datos, por favor corrija los datos en el formulario de sesión!!!</font>";
         }
 
      }
      else{
 	      	echo "<br><font color=red>La variable de formulario no existe o faltan datos del usuario!!!</font>";
      }
?>