class UserResponse {
  UserResponse({
    required this.status,
    required this.data,
    required this.httpCode,
  });

  int status;
  UserDataResponse data;
  int httpCode;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        status: json["status"],
        data: UserDataResponse.fromJson(json["data"]),
        httpCode: json["httpCode"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "httpCode": httpCode,
      };
}

class UserDataResponse {
  UserDataResponse({
    required this.id,
    required this.vendorId,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.status,
    required this.accountVerify,
    required this.role,
    required this.token,
  });

  String id;
  String vendorId;
  String firstName;
  String lastName;
  String phone;
  String status;
  bool accountVerify;
  String role;
  String token;

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      UserDataResponse(
        id: json["_id"],
        vendorId: json["vendorId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        status: json["status"],
        accountVerify: json["accountVerify"],
        role: json["role"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "vendorId": vendorId,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "status": status,
        "accountVerify": accountVerify,
        "role": role,
        "token": token,
      };
}
