import 'dart:convert';

List<MessageJson> messageJsonFromJson(String str) => List<MessageJson>.from(json.decode(str).map((x) => MessageJson.fromJson(x)));

String messageJsonToJson(List<MessageJson> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageJson {
  MessageJson({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  factory MessageJson.fromJson(Map<String, dynamic> json) => MessageJson(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };

  @override
  String toString() {
    return '{id：$id, userID：$userId, title：$title, body：$body}';
  }
}
