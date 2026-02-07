import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInputField(
      {super.key, required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, bottom: 25, top: 10),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
          ),
          child: Row(
            children: [
              const SizedBox(width: 15),
              const Icon(Icons.mic_none_outlined,
                  color: Color(0xFF2EAB4F), size: 22),
              const SizedBox(width: 12),
              const Icon(Icons.sentiment_satisfied_alt_outlined,
                  color: Color(0xFF2EAB4F), size: 22),
              const SizedBox(width: 12),
              const Icon(Icons.image_outlined,
                  color: Color(0xFF2EAB4F), size: 22),
              Expanded(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: controller,
                    textAlign: TextAlign.right,
                    decoration: const InputDecoration(
                      hintText: 'الرسالة...',
                      hintStyle: TextStyle(
                          color: Color(0xFF2EAB4F),
                          fontFamily: 'Cairo',
                          fontSize: 14),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
