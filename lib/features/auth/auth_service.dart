// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart'; // إضافة المكتبة

class AuthService {
  final String baseUrl = "http://10.0.2.2/tadamon_api";

  // --- دالة إنشاء حساب جديد ---
  Future<String> registerUser(String firstName, String lastName, String email,
      String phone, String birth_Date, String password) async {
    try {
      var response = await http.post(
        Uri.parse("$baseUrl/register.php"),
        body: {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "phone": phone,
          "birthdate": birth_Date,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        if (response.body.toLowerCase().contains("success")) {
          print("تم التسجيل بنجاح في قاعدة البيانات");

          // حفظ الحالة عند التسجيل الناجح أيضاً ليدخل المستخدم مباشرة
          await _saveLoginStatus(email);

          return "success";
        } else {
          print("رد السيرفر: ${response.body}");
          return response.body;
        }
      } else {
        return "error_connection";
      }
    } catch (e) {
      print("حدث خطأ أثناء الاتصال: $e");
      return "exception";
    }
  }

  // --- دالة تسجيل الدخول ---
  Future<String> loginUser(String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse("$baseUrl/login.php"),
        body: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        String body = response.body.toLowerCase();
        if (body.contains("success")) {
          print("تم تسجيل الدخول بنجاح");

          // --- الجديد: حفظ حالة تسجيل الدخول ---
          await _saveLoginStatus(email);

          return "success";
        } else {
          print("رد السيرفر: ${response.body}");
          return "خطأ في الإيميل أو كلمة المرور";
        }
      } else {
        return "server_error_${response.statusCode}";
      }
    } catch (e) {
      print("حدث خطأ في الاتصال: $e");
      return "exception";
    }
  }

  // --- دالة مساعدة لحفظ البيانات محلياً ---
  Future<void> _saveLoginStatus(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userEmail', email);
  }

  // --- دالة لتسجيل الخروج (Logout) ---
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // يمسح كل البيانات المحفوظة
  }

  // --- دالة التحقق من الإيميل لإعادة تعيين كلمة السر ---
  Future<String> checkEmailAndSendRequest(String email) async {
    try {
      var response = await http.post(
        Uri.parse("$baseUrl/forget_password.php"),
        body: {
          "email": email,
        },
      );

      if (response.statusCode == 200) {
        String body = response.body.toLowerCase();
        if (body.contains("success")) {
          print("تم العثور على الإيميل وإرسال طلب الاستعادة");
          return "success";
        } else if (body.contains("email_not_found")) {
          return "هذا البريد الإلكتروني غير مسجل لدينا";
        } else {
          return "حدث خطأ ما، حاول لاحقاً";
        }
      } else {
        return "server_error";
      }
    } catch (e) {
      print("حدث خطأ في الاتصال: $e");
      return "exception";
    }
  }
}
