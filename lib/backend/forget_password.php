<?php
header('Content-Type: application/json; charset=utf-8');
include "db_conn.php";

$email = isset($_POST['email']) ? $_POST['email'] : '';

if(!empty($email)) {
    // 1. التأكد من وجود الحساب
    $checkUser = "SELECT * FROM users WHERE email = '$email'";
    $res = mysqli_query($conn, $checkUser);

    if (mysqli_num_rows($res) > 0) {
        // 2. إنشاء التوكين (سلسلة نصية عشوائية فريدة)
        $token = bin2hex(random_bytes(32)); 
        
        // 3. تخزين التوكين في قاعدة البيانات (لتتم مقارنته لاحقاً)
        // ملاحظة: تأكدي من إضافة عمود reset_token في جدول users
        $updateToken = "UPDATE users SET reset_token = '$token' WHERE email = '$email'";
        
        if(mysqli_query($conn, $updateToken)) {
            // 4. هنا يتم إرسال الإيميل (محاكاة أو حقيقي)
            
            echo json_encode("success"); // نرسل نجاح للفلاتر
        } else {
            echo json_encode("db_error");
        }
    } else {
        echo json_encode("email_not_found");
    }
} else {
    echo json_encode("fields_empty");
}
mysqli_close($conn);
?>