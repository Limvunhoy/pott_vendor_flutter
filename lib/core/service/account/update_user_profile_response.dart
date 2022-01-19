// To parse this JSON data, do
//
//     final updateUserProfileResponse = updateUserProfileResponseFromJson(jsonString);

import 'dart:convert';

UpdateUserProfileResponse updateUserProfileResponseFromJson(String str) =>
    UpdateUserProfileResponse.fromJson(json.decode(str));

String updateUserProfileResponseToJson(UpdateUserProfileResponse data) =>
    json.encode(data.toJson());

class UpdateUserProfileResponse {
  UpdateUserProfileResponse({
    required this.response,
    required this.results,
  });

  ProfileResponse response;
  ProfileResult results;

  factory UpdateUserProfileResponse.fromJson(Map<String, dynamic> json) =>
      UpdateUserProfileResponse(
        response: ProfileResponse.fromJson(json["response"]),
        results: ProfileResult.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
        "results": results.toJson(),
      };
}

class ProfileResponse {
  ProfileResponse({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}

class ProfileResult {
  ProfileResult({
    required this.path,
  });

  String path;

  factory ProfileResult.fromJson(Map<String, dynamic> json) => ProfileResult(
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
      };
}
