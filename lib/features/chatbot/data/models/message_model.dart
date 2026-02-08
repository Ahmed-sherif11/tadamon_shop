class MessageModel {
  final String text;
  final bool isUser;
  final String? time; // هتحطي السطر ده عشان الوقت يشتغل

  MessageModel({
    required this.text,
    required this.isUser,
    this.time, // وتضيفي دي هنا كمان
  });
}
