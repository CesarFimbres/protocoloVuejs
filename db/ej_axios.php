<?php
include_once 'conn.php';
$obj = new Connection();
$conexion = $obj->Conectar();



$_POST = json_decode(file_get_contents("php://input"), true);
$option = (isset($_POST['option'])) ? $_POST['option'] : '';
$idTablero = (isset($_POST['idTablero'])) ? $_POST['idTablero'] : '';
$dataForm = (isset($_POST['data']))? $_POST['data'] :  'no llego valor';
$data = json_decode($dataForm);

 foreach($data->checkbox as $tag => $valor) {
    echo $tag ." con valorcito igual a: " . $valor . "<br>";
}

// echo '<br>______________________________________________________ Variables con acceso especifico<br>';

// echo '<br>--- option: ';
// echo $option;
// echo '<br>--- idTablero: ';
// echo $idTablero;
// echo '<br>--- dataForm: ';
// echo $dataForm->text[0]->tst4;

switch ($option) {

    case 6:
        // Recibir el objeto e insertar respuestas
        foreach($data->checkbox as $tag => $valor) {
            if ($tag) {
                $consulta = "INSERT INTO inspeccion (valor, tag, idTablero ) VALUES('$valor', '$tag', '$idTablero') ";
                $resultado = $conexion->prepare($consulta);
                $resultado->execute();
             }
         }
        // foreach($objeto->textbox[0] as $tag => $valor) {
        //     $idTablero= 13;
        //     if ($tag) {
        //         $consulta = "INSERT INTO inspeccion (valor, tag, idTablero ) VALUES('$valor', '$tag', '$idTablero') ";
        //         $resultado = $conexion->prepare($consulta);
        //         $resultado->execute();
        //     }
        // }
    break;

}

print json_encode($data, JSON_UNESCAPED_UNICODE);
$conexion = NULL;
