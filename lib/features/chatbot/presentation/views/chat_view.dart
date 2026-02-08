import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/message_model.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/chat_input_field.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final local = S.of(context);

    final List<MessageModel> messages = [
      MessageModel(
          text: local.botWelcomeMessage,
          isUser: false,
          time: "اليوم، 10:50 صباحاً"),
      MessageModel(text: local.userOrderTrack, isUser: true),
      MessageModel(text: local.botOrderResponse, isUser: false),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new,
                  color: Color(0xFF2EAB4F), size: 20),
              onPressed: () => Navigator.pop(context),
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/pr1.jpg'),
              radius: 18,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  local.smartAssistant,
                  style: const TextStyle(
                    color: Color(0xFF2EAB4F),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                ),
                Text(
                  local.activeStatus,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone_outlined,
                color: Color(0xFF2EAB4F), size: 26),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.videocam_outlined,
                color: Color(0xFF2EAB4F), size: 22),
            onPressed: () {},
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      ChatBubble(message: messages[index]),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Center(
                          child: Text(
                            messages[index].time ?? "",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: ChatBubble(message: messages[index]),
                );
              },
            ),
          ),
          ChatInputField(
            controller: _controller,
            onSend: () {
              if (_controller.text.isNotEmpty) {
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
