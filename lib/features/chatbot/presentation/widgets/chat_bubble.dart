import 'package:flutter/material.dart';
import '../../data/models/message_model.dart';

class ChatBubble extends StatelessWidget {
  final MessageModel message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    bool isUser = message.isUser;

    return Padding(
      padding: EdgeInsets.only(
        bottom: 20,
        left: isUser ? 0.0 : 60.0,
        right: isUser ? 52.0 : 0.0,
      ),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) ...[
            const CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage('assets/images/pr1.jpg'),
            ),
            const SizedBox(width: 8),
          ],
          Container(
            constraints: BoxConstraints(
              maxWidth: isUser ? 223 : 227,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: isUser ? const Color(0xffF2F4F6) : const Color(0xFF2EAB4F),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: Radius.circular(isUser ? 16 : 0),
                bottomRight: Radius.circular(isUser ? 0 : 16),
              ),
            ),
            child: Text(
              message.text,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: isUser ? Colors.black : Colors.white,
                fontFamily: 'Cairo',
                fontSize: 13,
                height: 1.3,
              ),
            ),
          ),
          if (isUser) ...[
            const SizedBox(width: 8),
            const CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage('assets/images/pr2.jpg'),
            ),
          ],
        ],
      ),
    );
  }
}
