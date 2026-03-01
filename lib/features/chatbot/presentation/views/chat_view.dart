import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tadamon_shop/features/chatbot/manager/chat_bloc.dart';
import 'package:tadamon_shop/features/chatbot/presentation/widgets/chat_bubble.dart';
import 'package:tadamon_shop/features/chatbot/presentation/widgets/chat_input_field.dart';
import 'package:tadamon_shop/generated/l10n.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(),
      child: Builder(
        builder: (blocContext) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            blocContext
                .read<ChatBloc>()
                .add(InitChatEvent(S.of(blocContext).botWelcomeMessage));
          });

          return const ChatViewBody();
        },
      ),
    );
  }
}

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final local = S.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new,
                  color: Color(0xFF2EAB4F), size: 20),
              onPressed: () => Navigator.pop(context),
            ),
            const CircleAvatar(
                backgroundImage: AssetImage('assets/images/pr1.jpg'),
                radius: 18),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(local.smartAssistant,
                    style: const TextStyle(
                        color: Color(0xFF2EAB4F),
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                Text(local.activeStatus,
                    style: const TextStyle(color: Colors.grey, fontSize: 10)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.phone_outlined, color: Color(0xFF2EAB4F)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("جاري الاتصال...")));
              }),
          IconButton(
              icon:
                  const Icon(Icons.videocam_outlined, color: Color(0xFF2EAB4F)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("بدء مكالمة فيديو...")));
              }),
        ],
      ),
      body: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) => _scrollToBottom(),
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) =>
                      ChatBubble(message: state.messages[index]),
                ),
              ),
              if (state.isLoading)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                  child: LinearProgressIndicator(
                      color: Color(0xFF2EAB4F), backgroundColor: Colors.white),
                ),
              ChatInputField(
                  controller: _controller,
                  onSend: () {
                    if (_controller.text.trim().isNotEmpty) {
                      context
                          .read<ChatBloc>()
                          .add(SendMessageEvent(_controller.text.trim()));
                      _controller.clear();
                    }
                  }),
            ],
          );
        },
      ),
    );
  }
}
