import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadamon_shop/features/chatbot/data/models/message_model.dart';
import 'package:tadamon_shop/features/chatbot/data/services/chat_service.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatService _chatService = ChatService();

  ChatBloc() : super(ChatState(messages: [])) {
    on<InitChatEvent>((event, emit) {
      emit(ChatState(messages: [
        MessageModel(text: event.welcomeMsg, isUser: false, time: "10:50 ص")
      ]));
    });

    on<SendMessageEvent>((event, emit) async {
      final updatedMessages = List<MessageModel>.from(state.messages);
      updatedMessages.add(MessageModel(text: event.userMsg, isUser: true));
      updatedMessages.add(MessageModel(text: "", isUser: false));

      emit(ChatState(messages: updatedMessages, isLoading: true));

      try {
        String accumulatedText = "";
        final history = state.messages.sublist(0, state.messages.length - 1);

        await for (final textChunk
            in _chatService.getChatResponse(event.userMsg, history)) {
          accumulatedText += textChunk;
          state.messages.last =
              MessageModel(text: accumulatedText, isUser: false);
          emit(
              ChatState(messages: List.from(state.messages), isLoading: false));
        }
      } catch (e) {
        state.messages.last =
            MessageModel(text: "عذراً، حدث خطأ في الاتصال.", isUser: false);
        emit(ChatState(messages: List.from(state.messages), isLoading: false));
      }
    });
  }
}
