// To parse this JSON data, do
//
//     final uploadImageResponse = uploadImageResponseFromJson(jsonString);

import 'dart:convert';

UploadImageResponse uploadImageResponseFromJson(String str) =>
    UploadImageResponse.fromJson(json.decode(str));

String uploadImageResponseToJson(UploadImageResponse data) =>
    json.encode(data.toJson());

class UploadImageResponse {
  UploadImageResponse({
    required this.response,
    required this.results,
  });

  Response response;
  Results results;

  factory UploadImageResponse.fromJson(Map<String, dynamic> json) =>
      UploadImageResponse(
        response: Response.fromJson(json["response"]),
        results: Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
        "results": results.toJson(),
      };
}

class Response {
  Response({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}

class Results {
  Results({
    required this.path,
  });

  String path;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
      };
}
