// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
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

  String _selectedCountryCode = "+20";
  final List<Map<String, String>> _countries = [
    {"code": "+20", "flag": "🇪🇬"},
    {"code": "+966", "flag": "🇸🇦"},
    {"code": "+971", "flag": "🇦🇪"},
  ];

  void _handleRegister(AppLocalizations l) {
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _birthDateController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _passController.text.isEmpty ||
        _confirmPassController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l.fill_err ?? 'Please fill all fields',
              style: const TextStyle(fontFamily: 'Tajawal')),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SuccessScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    // 2. استدعاء المترجم
    var l = AppLocalizations.of(context)!;
    bool isAr = Localizations.localeOf(context).languageCode == 'ar';

    return Directionality(
      textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
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
                            color: const Color.fromARGB(255, 18, 18, 18)
                                .withOpacity(0.1),
                            blurRadius: 25,
                            offset: const Offset(0, 10)),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Align(
                          alignment:
                              isAr ? Alignment.topRight : Alignment.topLeft,
                          child: IconButton(
                            icon: Icon(
                                isAr
                                    ? Icons.arrow_forward_ios
                                    : Icons.arrow_back_ios,
                                color: primaryColor,
                                size: 22),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        Text(
                          l.reg_ti, // عنوان "إنشاء حساب"
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Tajawal',
                            color: Color.fromARGB(255, 16, 138, 44),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(l.already, // "لديك حساب بالفعل؟"
                                style: const TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold)),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Text(isAr ? "تسجيل الدخول" : "Login",
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
                                    l.fname, _firstNameController, isAr)),
                            const SizedBox(width: 12),
                            Expanded(
                                child: _buildField(
                                    l.lname, _lastNameController, isAr)),
                          ],
                        ),
                        _buildField(l.em, _emailController, isAr,
                            icon: Icons.email_outlined),
                        _buildField(l.birth, _birthDateController, isAr,
                            icon: Icons.calendar_month_outlined),
                        _buildField(l.ph, _phoneController, isAr,
                            isPhone: true),
                        _buildField(l.ps, _passController, isAr, isPass: true),
                        _buildField(l.confirm, _confirmPassController, isAr,
                            isPass: true),
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
      {bool isPass = false, bool isPhone = false, IconData? icon}) {
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
            obscureText: isPass,
            keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
            textAlign: isAr ? TextAlign.right : TextAlign.left,
            style: const TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 20, 19, 19)),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF9F9F9),
              prefixIcon: isPhone
                  ? _buildCountryPicker(isAr)
                  : (icon != null
                      ? Icon(icon, color: primaryColor, size: 20)
                      : null),
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
      padding: const EdgeInsets.symmetric(horizontal: 4),
      margin: EdgeInsets.only(left: isAr ? 8 : 0, right: isAr ? 0 : 8),
      decoration: BoxDecoration(
          border: Border(
              left: isAr
                  ? BorderSide(color: Colors.grey.shade300)
                  : BorderSide.none,
              right: !isAr
                  ? BorderSide(color: Colors.grey.shade300)
                  : BorderSide.none)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedCountryCode,
          items: _countries
              .map((c) => DropdownMenuItem(
                  value: c['code'],
                  child: Row(children: [
                    Text(c['flag']!),
                    const SizedBox(width: 6),
                    Text(c['code']!, style: const TextStyle(fontSize: 12))
                  ])))
              .toList(),
          onChanged: (v) => setState(() => _selectedCountryCode = v!),
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
