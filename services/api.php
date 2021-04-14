<?php
header("Access-Control-Allow-Origin: * ");
header("Access-Control-Allow-Methods: GET, POST ");
header("Access-Control-Allow-Headers: *");

require '../models/ConnectionDB.php';
require_once '../models/Booking.php';
require_once '../models/Gear.php';
require_once '../models/LineBooking.php';

$booking= new Booking($db);
$gear= new Gear($db);
$lineBooking=new LineBooking($db);

$req='';
$id=isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : null;

//GET REQUESTS 
if(isset($_GET['req']) && $_GET['req']!=''){    
    $req=$_GET['req'];
}

if($req=='lineBookings'){
    $lineBookings=json_encode($lineBooking->getLineBookings());
    $lineBookings=str_replace("lb_arrival_place", 'title', $lineBookings);
    $lineBookings=str_replace("lb_date_start", 'start', $lineBookings);
    $lineBookings=str_replace("lb_date_end", 'end', $lineBookings);
    return print_r($lineBookings);die();
}else if($req=='bookings'){
    return print_r(json_encode($booking->getBookings()));
}else if($req=='booking' && $id!=null){
    return print_r(json_encode($booking->getBooking($id)));
}else if($req=='gears'){
    return print_r(json_encode($gear->getGears()));
}else if($req=='gear' && $id!=null){
    return print_r(json_encode($gear->getGear($id)));
}



//POST REQUESTS

if($req=='addReservation'){
    $resp=$lineBooking->addLineBooking((int)$_POST['bk_id'], (int)$_POST['gc_id'], $_POST['date_start'], $_POST['date_end'], (string)$_POST['arrival_place'], (int)$_POST['nb']);    
    print_r($resp);die();
}else if($req=='updateReservation'){
    $resp=$lineBooking->updateLineBooking($_POST['bk_id'], $_POST['gc_id'], $_POST['date_start'], $_POST['date_end'], (string)$_POST['arrival_place'], $_POST['nb'], $_POST['oldBk_id'], $_POST['oldGc_id'], $_POST['oldDate_start'], $_POST['oldDate_end'], (string)$_POST['oldArrival_place'], $_POST['oldNb']);    
    print_r($resp);die();
}else if($req=='deleteReservation'){
    $resp=$lineBooking->deleteLineBooking($_POST['oldBk_id'], $_POST['oldGc_id'], $_POST['oldDate_start'], $_POST['oldDate_end'], (string)$_POST['oldArrival_place'], $_POST['oldNb']);    
    print_r($resp);die();
}

