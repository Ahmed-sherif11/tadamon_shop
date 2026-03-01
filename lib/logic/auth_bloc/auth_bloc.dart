import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:tadamon_app/features/auth/auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;
  AuthBloc(this.authService) : super(AuthInitial()) {
    // 1. التعامل مع طلب تسجيل الدخول (Login)
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading()); // أظهر دوامة التحميل
      try {
        String result =
            await authService.loginUser(event.email, event.password);
        if (result == "success") {
          emit(AuthSuccess()); // نجاح
        } else {
          emit(AuthError(result)); // فشل (عرض رسالة السيرفر)
        }
      } catch (e) {
        emit(AuthError("فشل الاتصال بالسيرفر"));
      }
    });

    // 2. التعامل مع طلب إنشاء حساب (Register)
    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        String result = await authService.registerUser(
          event.firstName,
          event.lastName,
          event.email,
          event.phone,
          event.birthDate,
          event.password,
        );
        if (result == "success") {
          emit(AuthSuccess());
        } else {
          emit(AuthError(result));
        }
      } catch (e) {
        emit(AuthError("تعذر إتمام التسجيل"));
      }
    });

    // 3. التعامل مع طلب نسيت كلمة السر (Forgot Password)
    on<ForgotPasswordRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        String result = await authService.checkEmailAndSendRequest(event.email);
        if (result == "success") {
          emit(AuthSuccess());
        } else {
          emit(AuthError(result));
        }
      } catch (e) {
        emit(AuthError("خطأ في إرسال طلب استعادة الحساب"));
      }
    });
  }
}
