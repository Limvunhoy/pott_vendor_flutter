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
    this.cover,
    this.photo,
    this.email,
    this.address,
    required this.role,
    required this.token,
  });

  String id;
  int vendorId;
  String firstName;
  String lastName;
  String phone;
  String status;
  bool accountVerify;
  String? cover;
  String? photo;
  String? email;
  String? address;
  String role;
  String token;

  UserDataResponse copyWith({
    String? id,
    int? vendorId,
    String? firstName,
    String? lastName,
    String? phone,
    String? status,
    bool? accountVerify,
    String? cover,
    String? photo,
    String? email,
    String? address,
    String? role,
    String? token,
  }) =>
      UserDataResponse(
        id: id ?? this.id,
        vendorId: vendorId ?? this.vendorId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        status: status ?? this.status,
        accountVerify: accountVerify ?? this.accountVerify,
        cover: cover ?? this.cover,
        photo: photo ?? this.photo,
        email: email ?? this.email,
        address: address ?? this.address,
        role: role ?? this.role,
        token: token ?? this.token,
      );

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      UserDataResponse(
        id: json["_id"],
        vendorId: json["vendorId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        status: json["status"],
        accountVerify: json["accountVerify"],
        cover: json["cover"],
        photo: json["photo"],
        email: json["email"],
        address: json["address"],
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
        "cover": cover,
        "photo": photo,
        "email": email,
        "address": address,
        "role": role,
        "token": token,
      };
}
