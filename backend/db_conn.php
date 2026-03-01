<?php
$host = "localhost";
$user = "root";
$pass = "";
$db_name = "tadamon_db"; 

// إنشاء الاتصال
$conn = mysqli_connect($host, $user, $pass, $db_name);

// التحقق من الاتصال
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// السطر السحري لضمان دعم اللغة العربية (UTF-8)
mysqli_set_charset($conn, "utf8");
?>