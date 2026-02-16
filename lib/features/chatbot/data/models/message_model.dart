class MessageModel {
  final String text;
  final bool isUser;
  final String? time;

  MessageModel({
    required this.text,
    required this.isUser,
    this.time,
  });
}
