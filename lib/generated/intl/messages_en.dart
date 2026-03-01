// ignore_for_file: depend_on_referenced_packages, prefer_generic_function_type_aliases, unnecessary_new

import 'package:intl/intl.dart';

import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  @override
  String get localeName => 'en';

  @override
  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{};
}
