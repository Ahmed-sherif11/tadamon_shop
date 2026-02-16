import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/message_model.dart';

class ChatService {
  final String _apiKey = 'AIzaSyCcqrmFYh1qieTA-v_dajBoGyb9971d8uo';

  Uri _endpoint() => Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$_apiKey',
      );

  Stream<String> getChatResponse(
    String userMessage,
    List<MessageModel> history,
  ) async* {
    try {
      final url = _endpoint();

      final body = {
        "contents": [
          {
            "parts": [
              {"text": userMessage},
            ],
          },
        ],
      };

      final res = await http.post(
        url,
        headers: const {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (res.statusCode != 200) {
        yield 'خطأ ${res.statusCode}: ${res.body}';
        return;
      }

      final data = jsonDecode(res.body);

      final text =
          data["candidates"]?[0]?["content"]?["parts"]?[0]?["text"]?.toString();

      yield (text == null || text.trim().isEmpty) ? 'لم يصل رد' : text;
    } catch (e) {
      yield 'استثناء: $e';
    }
  }
}
