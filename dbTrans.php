<?php
    $conn= new mysqli("localhost", "root", "", "protocolos");
    $conn->set_charset('utf8');
    
    if ($conn->connect_error){
        die("¡ Conexion fallida... !" . $conn->connect_error);
    }
    
    $result= array('error'=>false);
    $action= '';
    
    if(isset($_GET['action'])){
        $action= $_GET['action'];
    }
  
    if($action=='show'){
        $sql= $conn->query("SELECT * FROM tablero ORDER BY id DESC LIMIT 5");
        $members = array();
        while($row = $sql->fetch_assoc()){
            array_push($members, $row);
        }
        $result['members'] = $members;
    }
    
    if($action=='search'){
        $keyword = $_POST['keyword'];
        $sql = $conn->query("SELECT * FROM tablero WHERE nombre LIKE '%$keyword%' OR cliente LIKE '%$keyword%' OR proyecto LIKE '%$keyword%'");
        $members = array();
        if ($sql) {
            while ($row = $sql->fetch_assoc()) {
                array_push($members, $row);
            }
            $result['members'] = $members;
        } else {
            $result['message'] = "No hay servicio en este momento, intente nuevamente mas tarde";
            $result['error'] = true;
        }
    }
    
    if($action == 'create'){
        $nombre= $_POST['nombre'];
        $cliente= $_POST['cliente'];
        $proyecto= $_POST['proyecto'];
        $sistema = $_POST['sistema'];
        $voltaje = $_POST['voltaje'];
        $unifilar = $_POST['unifilar'];
        $layout = $_POST['layout'];
        $material = $_POST['material'];
        $metrel = $_POST['metrel'];
        $comentario = $_POST['comentario'];
        $fecha = $_POST['fecha'];
        $idequipo = $_POST['idequipo'];
        $idinspeccion = $_POST['idinspeccion'];
        $idcontinuidad = $_POST['idcontinuidad'];
        $idresistencia = $_POST['idresistencia'];
        $idhipot = $_POST['idhipot'];
        $idreportes = $_POST['idreportes'];
        $sttablero = $_POST['sttablero'];
        $stinspeccion = $_POST['stinspeccion'];
        $stcontinuidad = $_POST['stcontinuidad'];
        $stresistencia = $_POST['stresistencia'];
        $sthipot = $_POST['sthipot'];

        $sInsert= "INSERT INTO tablero (
                id, nombre, cliente, proyecto, sistema, 
                voltaje, unifilar, layout, material, metrel, 
                comentario, fecha, idequipo, idinspeccion, idcontinuidad, 
                idresistencia, idhipot, idreportes, sttablero, stinspeccion, 
                stcontinuidad, stresistencia, sthipot) 
                VALUES (
                    NULL, '$nombre', '$cliente', '$proyecto', '$sistema', 
                    '$voltaje', '$unifilar', '$layout', '$material', '$metrel', 
                    '$comentario', '$fecha', NULL, NULL, NULL, 
                    NULL, NULL, NULL, '$sttablero', '$stinspeccion', 
                    '$stcontinuidad', '$stresistencia', '$sthipot' )";

        $sql= $conn->query($sInsert);
        if($sql){
            $result['message']= "Registro insertado correctamente !";
            $result['error']= false;
        }
        else {
            $result['message']= "Inserción fallida !";
            $result['error']= true;
            }
    }

    if($action == 'last'){
        $sql= $conn->query("SELECT * FROM tablero ORDER by id DESC LIMIT 1");
        $users= array();
        
        if($sql){
            $result['users']= $sql->fetch_assoc();
        }
        else {
            $result['message']= "No hay servicio en este momento, intente nuevamente mas tarde";
            $result['error']= true;
            }
    }    

    if($action == 'read'){
        $sql= $conn->query("SELECT * FROM tablero ORDER BY id desc");
        $users= array();
        if($sql){
            while($row = $sql->fetch_assoc()){
                array_push($users, $row);
            }    
            $result['users']= $users;
        }
        else {
            $result['message']= "No hay servicio en este momento, intente nuevamente mas tarde";
            $result['error']= true;
            }
    }    
    
    if($action == 'update'){
        $id= $_POST['id'];
        $nombre= $_POST['nombre'];
        $cliente= $_POST['cliente'];
        $proyecto= $_POST['proyecto'];
        $sistema = $_POST['sistema'];
        $voltaje = $_POST['voltaje'];
        $unifilar = $_POST['unifilar'];
        $layout = $_POST['layout'];
        $material = $_POST['material'];
        $metrel = $_POST['metrel'];
        $comentario = $_POST['comentario'];
        $fecha = $_POST['fecha'];
        $idequipo = $_POST['idequipo'];
        $idinspeccion = $_POST['idinspeccion'];
        $idcontinuidad = $_POST['idcontinuidad'];
        $idresistencia = $_POST['idresistencia'];
        $idhipot = $_POST['idhipot'];
        $idreportes = $_POST['idreportes'];
        $sttablero = $_POST['sttablero'];
        $stinspeccion = $_POST['stinspeccion'];
        $stcontinuidad = $_POST['stcontinuidad'];
        $stresistencia = $_POST['stresistencia'];
        $sthipot = $_POST['sthipot'];

        $sUpdate= "UPDATE tablero SET
                    nombre='$nombre', cliente='$cliente', proyecto='$proyecto', sistema='$sistema', 
                    voltaje='$voltaje', unifilar='$unifilar', layout='$layout', material='$material', metrel='$metrel', 
                    comentario='$comentario', fecha='$fecha', sttablero='$sttablero', stinspeccion='$stinspeccion', 
                    stcontinuidad='$stcontinuidad', stresistencia='$stresistencia', sthipot='$sthipot'     
                  WHERE id='$id'";

        $sql= $conn->query($sUpdate);
        if($sql){
            $result['message']= "Registro actualizado correctamente !";
            $result['error']= false;
        }
        else {
            $result['message']= "Actualización fallida !";
            $result['error']= true;
            }
    }

    if($action == 'delete'){
        $id= $_POST['id'];

        $sDelete= "DELETE FROM tablero  
                  WHERE id='$id'";
        $sql= $conn->query($sDelete);
        if($sql){
            $result['message']= "Registro eliminado correctamente !";
            $result['error']= false;
        }
        else {
            $result['message']= "Eliminación fallida !";
            $result['error']= true;
            }
    }

    $conn->close();
    
    echo json_encode($result);

?>