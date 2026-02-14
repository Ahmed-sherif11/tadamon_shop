import 'package:flutter/material.dart';
import 'dart:math' as math;

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInputField({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 25, top: 10),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Transform.rotate(
                angle: math.pi,
                child: IconButton(
                  icon: const Icon(Icons.send_rounded,
                      color: Color(0xFF2EAB4F), size: 26),
                  onPressed: onSend,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.mic_none_outlined,
                    color: Color(0xFF2EAB4F), size: 22),
                onPressed: () {
                  _showFeedback(context, "تم تفعيل الميكروفون");
                },
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.sentiment_satisfied_alt_outlined,
                    color: Color(0xFF2EAB4F), size: 22),
                onPressed: () {
                  _showFeedback(context, "فتح قائمة الإيموجي");
                },
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.image_outlined,
                    color: Color(0xFF2EAB4F), size: 22),
                onPressed: () {
                  _showFeedback(context, "فتح معرض الصور");
                },
              ),
              Expanded(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: controller,
                    textAlign: TextAlign.right,
                    onSubmitted: (value) => onSend(),
                    textInputAction: TextInputAction.send,
                    decoration: const InputDecoration(
                      hintText: 'الرسالة...',
                      hintStyle: TextStyle(
                        color: Color(0xFF2EAB4F),
                        fontFamily: 'Cairo',
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
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

  void _showFeedback(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(fontFamily: 'Cairo')),
        backgroundColor: const Color(0xFF2EAB4F),
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}
