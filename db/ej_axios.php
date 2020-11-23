<?php
include_once 'conn.php';
$obj = new Connection();
$conexion = $obj->Conectar();

$_POST = json_decode(file_get_contents("php://input"), true);
$option = (isset($_POST['option'])) ? $_POST['option'] : '';
$idTablero = (isset($_POST['idTablero'])) ? $_POST['idTablero'] : '';
$dataForm = (isset($_POST['data']))? $_POST['data'] :  '';
$data = json_decode($dataForm);

// Codigo para revisar el contenido de los parametros en data
//  foreach($data->checkbox as $key => $value) {
//     echo $key ." con valor: " . $value . "<br>";
// }

switch ($option) {
	case 6:
        // Recibir el objeto e insertar respuestas
        foreach($data->checkbox as $key => $value) {
            if ($key) {
				$consulta = "INSERT INTO inspeccion ( tag, valor, idTablero ) VALUES( '$key', '$value', '$idTablero') ";
				echo $consulta;
                $resultado = $conexion->prepare($consulta);
                $resultado->execute();
             }
         }
        foreach($data->textbox as $key => $value) {
            if ($key) {
				$consulta = "INSERT INTO inspeccion ( tag, valor, idTablero ) VALUES( '$key', '$value', '$idTablero') ";
				echo $consulta;
                $resultado = $conexion->prepare($consulta);
                $resultado->execute();
             }
		 }
		foreach($data->selectbox as $key => $value) {
            if ($key) {
				$consulta = "INSERT INTO inspeccion ( tag, valor, idTablero ) VALUES( '$key', '$value', '$idTablero') ";
				echo $consulta;
                $resultado = $conexion->prepare($consulta);
                $resultado->execute();
             }
         }
    break;
}

print json_encode($data, JSON_UNESCAPED_UNICODE);
$conexion = NULL;
