import 'package:flutter/material.dart';
import '../../data/models/message_model.dart';
import '../../data/services/chat_service.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/chat_input_field.dart';
import '../../../../generated/l10n.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ChatService _chatService = ChatService();

  List<MessageModel> _allMessages = [];
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_allMessages.isEmpty) {
      final local = S.of(context);
      _allMessages = [
        MessageModel(
            text: local.botWelcomeMessage, isUser: false, time: "10:50 ص"),
      ];
    }
  }

  Future<void> _sendMessage() async {
    if (_controller.text.trim().isEmpty) return;
    String userMsg = _controller.text.trim();

    setState(() {
      _allMessages.add(MessageModel(text: userMsg, isUser: true));
      _allMessages.add(MessageModel(text: "", isUser: false));
      _isLoading = true;
    });

    _controller.clear();
    _scrollToBottom();

    try {
      String accumulatedText = "";
      final responseStream = _chatService.getChatResponse(
          userMsg, _allMessages.sublist(0, _allMessages.length - 2));

      await for (final textChunk in responseStream) {
        accumulatedText += textChunk;
        setState(() {
          _allMessages.last =
              MessageModel(text: accumulatedText, isUser: false);
          _isLoading = false;
        });
        _scrollToBottom();
      }
    } catch (e) {
      setState(() {
        _allMessages.last = MessageModel(
          text: "عذراً، حدث خطأ في الاتصال. تأكد من الإنترنت والمفتاح.",
          isUser: false,
        );
        _isLoading = false;
      });
    }
  }

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
          // تم تفعيل زرار الفيديو
          IconButton(
              icon:
                  const Icon(Icons.videocam_outlined, color: Color(0xFF2EAB4F)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("بدء مكالمة فيديو...")));
              }),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              itemCount: _allMessages.length,
              itemBuilder: (context, index) =>
                  ChatBubble(message: _allMessages[index]),
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
              child: LinearProgressIndicator(
                  color: Color(0xFF2EAB4F), backgroundColor: Colors.white),
            ),
          ChatInputField(controller: _controller, onSend: _sendMessage),
        ],
      ),
    );
  }
}
