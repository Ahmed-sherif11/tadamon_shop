<?php
Mysqli_report(MYSQLI_REPORT_OFF); // لمنع الأخطاء القوية من إيقاف السيرفر
header('Content-Type: application/json; charset=utf-8');
include "db_conn.php";

// 1. استقبال الحقول مع التأكد من المسميات لتدعم كود الدارت
$first_name = isset($_POST['first_name']) ? $_POST['first_name'] : '';
$last_name  = isset($_POST['last_name']) ? $_POST['last_name'] : '';
$email      = isset($_POST['email']) ? $_POST['email'] : '';
$phone      = isset($_POST['phone']) ? $_POST['phone'] : '';
$birth_date  = isset($_POST['birth_date']) ? $_POST['birth_date'] : ''; 
$password   = isset($_POST['password']) ? $_POST['password'] : '';

// 2. التحقق من الحقول الأساسية
if(!empty($first_name) && !empty($email) && !empty($password)) {
    $sql = "INSERT INTO users (first_name, last_name, email, phone, birth_date, password) 
            VALUES ('$first_name', '$last_name', '$email', '$phone', '$birth_date', '$password')";
            
    if (mysqli_query($conn, $sql)) {
        // إرسال رد يفهمه كود الدارت فوراً للانتقال
        echo json_encode("success"); 
    } else {
        echo json_encode("error: " . mysqli_error($conn));
    }
} else {
    echo json_encode("Fields are empty");
}

mysqli_close($conn);
?>