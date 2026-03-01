// ignore_for_file: deprecated_member_use, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadamon_app/logic/auth_bloc/auth_bloc.dart';
import 'package:tadamon_app/logic/auth_bloc/auth_event.dart';
import 'package:tadamon_app/logic/auth_bloc/auth_state.dart';
import 'package:tadamon_app/l10n/app_localizations.dart';
import 'success_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  final Color primaryColor = const Color(0xFF3FB56C);

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  bool _isPassObscure = true;
  bool _isConfirmPassObscure = true;
  String _selectedCountryCode = "+20";

  final List<Map<String, String>> _countries = [
    {"code": "+20", "flag": "🇪🇬"},
    {"code": "+966", "flag": "🇸🇦"},
    {"code": "+971", "flag": "🇦🇪"},
    {"code": "+965", "flag": "🇰🇼"},
    {"code": "+974", "flag": "🇶🇦"},
    {"code": "+973", "flag": "🇧🇭"},
    {"code": "+962", "flag": "🇯🇴"},
    {"code": "+212", "flag": "🇲🇦"},
    {"code": "+213", "flag": "🇩🇿"},
    {"code": "+970", "flag": "🇵🇸"},
    {"code": "+1", "flag": "🇺🇸"},
    {"code": "+44", "flag": "🇬🇧"},
  ];

  bool _isEmailValid(String email) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(email);
  }

  bool _isPhoneNumberValid() {
    String phone = _phoneController.text;
    if (phone.isEmpty) return false;
    if (_selectedCountryCode == "+20") return phone.length == 11;
    if (_selectedCountryCode == "+966" || _selectedCountryCode == "+971") {
      return phone.length == 9;
    }
    return phone.length >= 7 && phone.length <= 12;
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: primaryColor),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _birthDateController.text =
            "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  void _showSnackBar(String message, Color bgColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(fontFamily: 'Tajawal')),
        backgroundColor: bgColor,
      ),
    );
  }

  bool isAr(BuildContext context) =>
      Localizations.localeOf(context).languageCode == 'ar';

  @override
  Widget build(BuildContext context) {
    var l = AppLocalizations.of(context)!;
    bool currentIsAr = isAr(context);

    return Directionality(
      textDirection: currentIsAr ? TextDirection.rtl : TextDirection.ltr,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            //  لضمان الانتقال لصفحة النجاح والاستقرار فيها
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const SuccessScreen()),
              (route) => false,
            );
          } else if (state is AuthError) {
            _showSnackBar(state.message, Colors.red);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [primaryColor.withOpacity(0.2), Colors.white],
                  stops: const [0.0, 0.4],
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 60, 20, 40),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 25,
                                offset: const Offset(0, 10)),
                          ],
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Align(
                              alignment: currentIsAr
                                  ? Alignment.topRight
                                  : Alignment.topLeft,
                              child: IconButton(
                                icon: Icon(
                                    currentIsAr
                                        ? Icons.arrow_forward_ios
                                        : Icons.arrow_back_ios,
                                    color: primaryColor,
                                    size: 22),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                            Text(l.reg_ti,
                                style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Tajawal',
                                    color: Color(0xFF108A2C))),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${l.already} ",
                                    style: const TextStyle(
                                        fontFamily: 'Tajawal',
                                        color: Colors.grey)),
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Text(
                                      currentIsAr ? "تسجيل الدخول" : "Login",
                                      style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          color: primaryColor,
                                          fontWeight: FontWeight.w900)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                Expanded(
                                    child: _buildField(l.fname,
                                        _firstNameController, currentIsAr,
                                        isOnlyAlpha: true)),
                                const SizedBox(width: 12),
                                Expanded(
                                    child: _buildField(l.lname,
                                        _lastNameController, currentIsAr,
                                        isOnlyAlpha: true)),
                              ],
                            ),
                            _buildField(l.em, _emailController, currentIsAr,
                                icon: Icons.email_outlined),
                            _buildField(
                                l.birth, _birthDateController, currentIsAr,
                                icon: Icons.calendar_month_outlined,
                                isReadOnly: true,
                                onTap: () => _selectDate(context)),
                            _buildField(l.ph, _phoneController, currentIsAr,
                                isPhone: true),
                            _buildField(l.ps, _passController, currentIsAr,
                                isPass: true,
                                isObscure: _isPassObscure,
                                onToggleObscure: () => setState(
                                    () => _isPassObscure = !_isPassObscure)),
                            _buildField(
                                l.confirm, _confirmPassController, currentIsAr,
                                isPass: true,
                                isObscure: _isConfirmPassObscure,
                                onToggleObscure: () => setState(() =>
                                    _isConfirmPassObscure =
                                        !_isConfirmPassObscure)),
                            const SizedBox(height: 25),
                            _buildRegisterButton(l.btn_reg, l, state),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller, bool isAr,
      {bool isPass = false,
      bool isPhone = false,
      bool isOnlyAlpha = false,
      bool isReadOnly = false,
      bool? isObscure,
      VoidCallback? onToggleObscure,
      IconData? icon,
      VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        obscureText: isObscure ?? false,
        readOnly: isReadOnly,
        onTap: onTap,
        inputFormatters: [
          if (isOnlyAlpha)
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Zء-ي\s]')),
          if (isPhone) FilteringTextInputFormatter.digitsOnly,
          if (isPhone)
            LengthLimitingTextInputFormatter(
                _selectedCountryCode == "+20" ? 11 : 12),
        ],
        keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
        textAlign: isAr ? TextAlign.right : TextAlign.left,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.w600,
              color: Colors.grey),
          floatingLabelStyle:
              TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          filled: true,
          fillColor: const Color(0xFFF9F9F9),
          prefixIcon: isPhone
              ? _buildCountryPicker(isAr)
              : (icon != null
                  ? Icon(icon, color: primaryColor, size: 20)
                  : null),
          suffixIcon: isPass
              ? IconButton(
                  icon: Icon(
                      isObscure! ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey),
                  onPressed: onToggleObscure)
              : null,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade200)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: primaryColor, width: 1.5)),
        ),
      ),
    );
  }

  Widget _buildCountryPicker(bool isAr) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedCountryCode,
              icon: Icon(Icons.keyboard_arrow_down,
                  size: 16, color: primaryColor),
              items: _countries
                  .map((c) => DropdownMenuItem(
                      value: c['code'],
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Text(c['flag']!, style: const TextStyle(fontSize: 22)),
                        const SizedBox(width: 8),
                        Text(c['code']!,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Tajawal'))
                      ])))
                  .toList(),
              onChanged: (v) => setState(() {
                _selectedCountryCode = v!;
                _phoneController.clear();
              }),
            ),
          ),
          Container(
              height: 20,
              width: 1,
              color: Colors.grey.shade300,
              margin: const EdgeInsets.only(left: 8, right: 4)),
        ],
      ),
    );
  }

  Widget _buildRegisterButton(
      String title, AppLocalizations l, AuthState state) {
    bool isLoading = state is AuthLoading;
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : () {
                if (_firstNameController.text.isEmpty ||
                    _lastNameController.text.isEmpty ||
                    _emailController.text.isEmpty ||
                    _birthDateController.text.isEmpty ||
                    _phoneController.text.isEmpty ||
                    _passController.text.isEmpty ||
                    _confirmPassController.text.isEmpty) {
                  _showSnackBar(
                      l.fill_err ?? 'يرجى ملء جميع الحقول', Colors.red);
                  return;
                }
                if (!_isEmailValid(_emailController.text)) {
                  _showSnackBar(
                      isAr(context)
                          ? "صيغة البريد الإلكتروني غير صحيحة"
                          : "Invalid email format",
                      Colors.orange);
                  return;
                }
                if (!_isPhoneNumberValid()) {
                  _showSnackBar(
                      isAr(context)
                          ? "رقم الهاتف غير صحيح لهذه الدولة"
                          : "Invalid phone number",
                      Colors.orange);
                  return;
                }
                if (_passController.text != _confirmPassController.text) {
                  _showSnackBar(
                      isAr(context)
                          ? "كلمات المرور غير متطابقة"
                          : "Passwords do not match",
                      Colors.orange);
                  return;
                }
                // إرسال الطلب للبلوك
                context.read<AuthBloc>().add(RegisterRequested(
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      email: _emailController.text,
                      phone: _selectedCountryCode + _phoneController.text,
                      birthDate: _birthDateController.text,
                      password: _passController.text,
                    ));
              },
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2),
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 2.5))
            : Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Tajawal')),
      ),
    );
  }
}
