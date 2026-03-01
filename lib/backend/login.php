<?php
header('Content-Type: application/json; charset=utf-8');
include "db_conn.php";

$email    = isset($_POST['email']) ? $_POST['email'] : '';
$password = isset($_POST['password']) ? $_POST['password'] : '';

if(!empty($email) && !empty($password)) {
    
    // البحث عن المستخدم بالإيميل وكلمة المرور
    $sql = "SELECT * FROM users WHERE email = '$email' AND password = '$password'";
    $result = mysqli_query($conn, $sql);
    
    if (mysqli_num_rows($result) > 0) {
        // إذا وجد المستخدم، نرسل نجاح
        echo json_encode("success");
    } else {
        // إذا لم يجد تطابق
        echo json_encode("Invalid email or password");
    }
} else {
    echo json_encode("Fields are empty");
}

mysqli_close($conn);
?>