part of 'chat_bloc.dart';

class ChatState {
  final List<MessageModel> messages;
  final bool isLoading;

  ChatState({required this.messages, this.isLoading = false});
}
