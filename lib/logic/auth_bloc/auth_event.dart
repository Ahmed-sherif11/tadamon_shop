import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// 1. حدث تسجيل الدخول (Login)
class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

/// 2. حدث إنشاء حساب جديد (Register)
/// أضفت جميع الحقول التي استخدمتِها في RegisterScreen
class RegisterRequested extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phone; // يشمل كود الدولة + الرقم
  final String birthDate;
  final String password;

  RegisterRequested({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [firstName, lastName, email, phone, birthDate, password];
}

/// 3. حدث نسيت كلمة السر (Forgot Password)
class ForgotPasswordRequested extends AuthEvent {
  final String email;

  ForgotPasswordRequested({required this.email});

  @override
  List<Object?> get props => [email];
}
