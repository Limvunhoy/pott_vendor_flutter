class ErrorResponse {
  ErrorResponse({
    required this.status,
    required this.message,
    required this.httpCode,
  });

  int status;
  Message message;
  int httpCode;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        status: json["status"],
        message: Message.fromJson(json["message"]),
        httpCode: json["httpCode"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message.toJson(),
        "httpCode": httpCode,
      };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
}

class Message {
  Message({
    required this.code,
    required this.description,
  });

  int code;
  String description;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "description": description,
      };
}
