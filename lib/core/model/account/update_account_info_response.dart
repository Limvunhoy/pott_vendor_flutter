// To parse this JSON data, do
//
//     final updateAccountInfoResponse = updateAccountInfoResponseFromJson(jsonString);

import 'dart:convert';

UpdateAccountInfoResponse updateAccountInfoResponseFromJson(String str) =>
    UpdateAccountInfoResponse.fromJson(json.decode(str));

String updateAccountInfoResponseToJson(UpdateAccountInfoResponse data) =>
    json.encode(data.toJson());

class UpdateAccountInfoResponse {
  UpdateAccountInfoResponse({
    required this.status,
    required this.data,
    required this.httpCode,
  });

  int status;
  AccountData data;
  int httpCode;

  factory UpdateAccountInfoResponse.fromJson(Map<String, dynamic> json) =>
      UpdateAccountInfoResponse(
        status: json["status"],
        data: AccountData.fromJson(json["data"]),
        httpCode: json["httpCode"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "httpCode": httpCode,
      };
}

class AccountData {
  AccountData({
    required this.id,
    required this.address,
    required this.cover,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.lat,
    required this.lng,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.username,
    required this.status,
    required this.role,
    required this.enable,
    required this.createdAt,
    required this.vendorId,
  });

  String id;
  String address;
  String cover;
  String email;
  String firstName;
  String lastName;
  int lat;
  int lng;
  String phone;
  String photo;
  String? gender;
  String username;
  String status;
  String role;
  bool enable;
  int createdAt;
  int vendorId;

  factory AccountData.fromJson(Map<String, dynamic> json) => AccountData(
        id: json["_id"],
        address: json["address"],
        cover: json["cover"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        lat: json["lat"],
        lng: json["lng"],
        phone: json["phone"],
        photo: json["photo"],
        gender: json["gender"],
        username: json["username"],
        status: json["status"],
        role: json["role"],
        enable: json["enable"],
        createdAt: json["createdAt"],
        vendorId: json["vendorId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "address": address,
        "cover": cover,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "lat": lat,
        "lng": lng,
        "phone": phone,
        "photo": photo,
        "gender": gender,
        "username": username,
        "status": status,
        "role": role,
        "enable": enable,
        "createdAt": createdAt,
        "vendorId": vendorId,
      };
}
