// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  ];

  // دالة التحقق الذكية المحدثة
  bool _isPhoneNumberValid() {
    String phone = _phoneController.text;
    if (phone.isEmpty) return false;

    if (_selectedCountryCode == "+20") {
      // لمفتاح مصر: يجب أن يكون 11 رقم ويبدأ بـ 0 (مثل 010, 011, 012, 015)
      return phone.length == 11 && phone.startsWith('0');
    } else if (_selectedCountryCode == "+966" ||
        _selectedCountryCode == "+971") {
      // للسعودية والإمارات: غالباً 9 أرقام بدون الصفر الدولي
      return phone.length == 9;
    }
    return phone.length >= 8;
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

  void _handleRegister(AppLocalizations l) {
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _birthDateController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _passController.text.isEmpty ||
        _confirmPassController.text.isEmpty) {
      _showSnackBar(l.fill_err ?? 'يرجى ملء جميع الحقول', Colors.red);
    }
    // تفعيل التحقق الذكي هنا
    else if (!_isPhoneNumberValid()) {
      String errorMsg = isAr(context)
          ? "رقم الهاتف غير صحيح (يجب أن يكون 11 رقم لمصر ويبدأ بـ 0)"
          : "Invalid number (Must be 11 digits starting with 0 for Egypt)";
      _showSnackBar(errorMsg, Colors.orange);
    } else if (_passController.text != _confirmPassController.text) {
      _showSnackBar(
          isAr(context) ? "كلمات المرور غير متطابقة" : "Passwords do not match",
          Colors.orange);
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SuccessScreen()));
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
      child: Scaffold(
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
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
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
                        Text(
                          l.reg_ti,
                          style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Tajawal',
                              color: Color.fromARGB(255, 16, 138, 44)),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${l.already} ",
                                style: const TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 13,
                                    color: Colors.grey)),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Text(
                                  currentIsAr ? "تسجيل الدخول" : "Login",
                                  style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 13,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w900)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                                child: _buildField(
                                    l.fname, _firstNameController, currentIsAr,
                                    isOnlyAlpha: true)),
                            const SizedBox(width: 12),
                            Expanded(
                                child: _buildField(
                                    l.lname, _lastNameController, currentIsAr,
                                    isOnlyAlpha: true)),
                          ],
                        ),
                        _buildField(l.em, _emailController, currentIsAr,
                            icon: Icons.email_outlined),
                        _buildField(l.birth, _birthDateController, currentIsAr,
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
                        _buildRegisterButton(l.btn_reg, l),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                  color: Colors.grey)),
          const SizedBox(height: 6),
          TextField(
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
                    11), // تم التعديل لـ 11 رقم لمصر
            ],
            keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
            textAlign: isAr ? TextAlign.right : TextAlign.left,
            style: const TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            decoration: InputDecoration(
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
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade200)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: primaryColor, width: 1.5)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountryPicker(bool isAr) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedCountryCode,
          items: _countries
              .map((c) => DropdownMenuItem(
                  value: c['code'],
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(c['flag']!),
                      const SizedBox(width: 4),
                      Text(c['code']!,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ],
                  )))
              .toList(),
          onChanged: (v) => setState(() {
            _selectedCountryCode = v!;
            _phoneController.clear();
          }),
        ),
      ),
    );
  }

  Widget _buildRegisterButton(String title, AppLocalizations l) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () => _handleRegister(l),
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 2),
        child: Text(title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w900,
                fontFamily: 'Tajawal')),
      ),
    );
  }
}
