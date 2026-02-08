import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpFieldsItem extends StatelessWidget {
  const OtpFieldsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          5,
          (index) => SizedBox(
                height: 56,
                width: 50,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1 && index < 4) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color:
                              Color(0xFF2DB361)), // اللون الأخضر اللي في الصورة
                    ),
                  ),
                ),
              )),
    );
  }
}
