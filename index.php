<?php
require_once './models/Form.php';
require_once './models/ConnectionDB.php';
require_once './models/Booking.php';
require_once './models/Gear.php';

$managerBooking= new Booking($db);
$managerGear= new Gear($db);

$frm=new Form();

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/lib/jquery/cupertino/jquery-ui.min.css">
    <link rel="stylesheet" href="./assets/lib/fullcalendar/main.css">
    <link rel="stylesheet" href="./assets/lib//bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/style.css">
    <title>CalendCar JS</title>
</head>
<body>
    <div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <?php include_once('./partials/sidebar.php'); ?>
        </div>
        <div class="col-md-9">        
            <main>
                <div id="calendar">

                </div>
                <?php include_once('./partials/modal.php'); ?>
            </main>
        </div>
    </div>

    </div>
    <script src="./assets/lib/jquery/jquery.min.js"></script>
    <script src="./assets/lib/jquery/jquery-ui.min.js"></script>
	  <script src="./assets/lib/moment.min.js "></script>
    <script src="./assets/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="./assets/lib/fullcalendar/main.min.js" ></script>
    <script src="./assets/lib/fullcalendar/locales-all.js" ></script>
    <script src="./assets/js/main.js" ></script>
    
</body>
</html>