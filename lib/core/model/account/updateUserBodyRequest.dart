class UpdateAccountBodyRequest {
  String? lastname;
  String? firstname;
  String? photo;
  String? cover;
  String? phone;
  String? email;
  String? address;

  UpdateAccountBodyRequest(
      {this.lastname,
      this.firstname,
      this.photo,
      this.cover,
      this.phone,
      this.email,
      this.address});

  factory UpdateAccountBodyRequest.fromJson(Map<String, dynamic> json) =>
      UpdateAccountBodyRequest(
          lastname: json["lastName"],
          firstname: json["firstName"],
          photo: json["photo"],
          cover: json["cover"],
          phone: json["phone"],
          email: json["email"],
          address: json["address"]);

  Map<String, dynamic> toJson() => {
        "lastName": lastname,
        "firstName": firstname,
        "photo": photo,
        "cover": cover,
        "phone": phone,
        "email": email,
        "address": address,
      };
}
