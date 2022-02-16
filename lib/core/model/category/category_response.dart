// To parse this JSON data, do
//
//     final categoryResponse = categoryResponseFromJson(jsonString);

import 'dart:convert';

CategoryResponse categoryResponseFromJson(String str) =>
    CategoryResponse.fromJson(json.decode(str));

String categoryResponseToJson(CategoryResponse data) =>
    json.encode(data.toJson());

class CategoryResponse {
  CategoryResponse({
    required this.response,
    required this.results,
  });

  Response response;
  List<CategoryResult> results;

  CategoryResponse copyWith({
    Response? response,
    List<CategoryResult>? results,
  }) =>
      CategoryResponse(
        response: response ?? this.response,
        results: results ?? this.results,
      );

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        response: Response.fromJson(json["response"]),
        results: List<CategoryResult>.from(
            json["results"].map((x) => CategoryResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Response {
  Response({
    required this.code,
    required this.message,
  });

  int code;
  String message;

  Response copyWith({
    int? code,
    String? message,
  }) =>
      Response(
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}

class CategoryResult {
  CategoryResult({
    required this.data,
    required this.children,
  });

  CategoryData data;
  List<CategoryResult> children;

  CategoryResult copyWith({
    CategoryData? data,
    List<CategoryResult>? children,
  }) =>
      CategoryResult(
        data: data ?? this.data,
        children: children ?? this.children,
      );

  factory CategoryResult.fromJson(Map<String, dynamic> json) => CategoryResult(
        data: CategoryData.fromJson(json["data"]),
        children: List<CategoryResult>.from(
            json["children"].map((x) => CategoryResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
      };
}

class CategoryData {
  CategoryData({
    required this.dataId,
    required this.id,
    required this.nameEn,
    required this.icon,
    this.parent,
  });

  int dataId;
  String id;
  String nameEn;
  String icon;
  Parent? parent;

  CategoryData copyWith({
    int? dataId,
    String? id,
    String? nameKh,
    String? nameEn,
    String? nameCn,
    String? icon,
    int? sequence,
    bool? enable,
    bool? donation,
    Parent? parent,
  }) =>
      CategoryData(
        dataId: dataId ?? this.dataId,
        id: id ?? this.id,
        nameEn: nameEn ?? this.nameEn,
        icon: icon ?? this.icon,
        parent: parent ?? this.parent,
      );

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        dataId: json["id"],
        id: json["_id"],
        nameEn: json["nameEn"],
        icon: json["icon"],
        parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
      );

  Map<String, dynamic> toJson() => {
        "id": dataId,
        "_id": id,
        "nameEn": nameEn,
        "icon": icon,
        "parent": parent == null ? null : parent!.toJson(),
      };
}

class Parent {
  Parent({
    required this.id,
  });

  int id;

  Parent copyWith({
    int? id,
  }) =>
      Parent(
        id: id ?? this.id,
      );

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
