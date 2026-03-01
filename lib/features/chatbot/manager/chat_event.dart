part of 'chat_bloc.dart';

abstract class ChatEvent {}

class InitChatEvent extends ChatEvent {
  final String welcomeMsg;
  InitChatEvent(this.welcomeMsg);
}

class SendMessageEvent extends ChatEvent {
  final String userMsg;
  SendMessageEvent(this.userMsg);
}
