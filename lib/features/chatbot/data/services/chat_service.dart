import 'package:google_generative_ai/google_generative_ai.dart';
import '../models/message_model.dart';

class ChatService {
  final String _apiKey = "AIzaSyCcqrmFYh1qieTA-v_dajBoGyb9971d8uo";
  late final GenerativeModel _model;

  ChatService() {
    _model = GenerativeModel(
      model: 'gemini-3-flash',
      apiKey: _apiKey,
      safetySettings: [
        SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.none),
      ],
    );
  }

  Stream<String> getChatResponse(
      String userMessage, List<MessageModel> history) async* {
    final contentHistory = history.map((m) {
      if (m.isUser) {
        return Content.text(m.text);
      } else {
        return Content.model([TextPart(m.text)]);
      }
    }).toList();

    final chat = _model.startChat(history: contentHistory);
    final responseStream = chat.sendMessageStream(Content.text(userMessage));

    await for (final chunk in responseStream) {
      if (chunk.text != null) {
        yield chunk.text!;
      }
    }
  }
}
