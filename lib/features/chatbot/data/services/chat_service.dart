import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/message_model.dart';

class ChatService {
  final String _apiKey = (dotenv.env['GEMINI_API_KEY'] ?? '').trim();

  Uri _endpoint() => Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$_apiKey',
      );

  Stream<String> getChatResponse(
      String userMessage, List<MessageModel> history) async* {
    if (_apiKey.isEmpty) {
      yield 'خطأ: المفتاح غير موجود في ملف .env';
      return;
    }

    final contents = <Map<String, dynamic>>[];

    for (final m in history) {
      final role = m.isUser ? 'user' : 'model';
      final text = m.text.trim();
      if (text.isEmpty) continue;

      contents.add({
        "role": role,
        "parts": [
          {"text": text}
        ]
      });
    }

    final prompt = userMessage.trim().isEmpty ? "مرحبا" : userMessage.trim();

    contents.add({
      "role": "user",
      "parts": [
        {"text": prompt}
      ]
    });

    final body = {
      "contents": contents,
      "generationConfig": {
        "temperature": 0.7,
        "maxOutputTokens": 800,
      }
    };

    try {
      final res = await http
          .post(
            _endpoint(),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 25));

      final status = res.statusCode;

      final data = jsonDecode(res.body) as Map<String, dynamic>;

      if (status == 200) {
        final candidates = (data["candidates"] as List?) ?? [];
        if (candidates.isEmpty) {
          yield 'رد السيرفر فارغ.';
          return;
        }

        final content = candidates[0]["content"] as Map<String, dynamic>?;
        final parts = (content?["parts"] as List?) ?? [];

        final buffer = StringBuffer();
        for (final p in parts) {
          final t = (p as Map?)?["text"];
          if (t is String && t.trim().isNotEmpty) {
            if (buffer.isNotEmpty) buffer.write('\n');
            buffer.write(t);
          }
        }

        final out = buffer.toString().trim();
        yield out.isEmpty ? 'لم يصل نص في الرد.' : out;
      } else {
        final err = data["error"] as Map<String, dynamic>?;
        final msg = err?["message"] ?? "خطأ مجهول";
        yield 'خطأ من جوجل ($status): $msg';
      }
    } on TimeoutException {
      yield 'انتهت مهلة الاتصال.';
    } on SocketException {
      yield 'لا يوجد اتصال بالشبكة.';
    } catch (e) {
      yield 'حدث خطأ: $e';
    }
  }
}
