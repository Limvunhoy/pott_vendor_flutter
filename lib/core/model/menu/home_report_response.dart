// To parse this JSON data, do
//
//     final homeReportResponse = homeReportResponseFromJson(jsonString);

import 'dart:convert';

HomeReportResponse homeReportResponseFromJson(String str) =>
    HomeReportResponse.fromJson(json.decode(str));

String homeReportResponseToJson(HomeReportResponse data) =>
    json.encode(data.toJson());

class HomeReportResponse {
  HomeReportResponse({
    required this.status,
    required this.data,
    required this.httpCode,
  });

  int status;
  HomeReportData data;
  int httpCode;

  HomeReportResponse copyWith({
    int? status,
    HomeReportData? data,
    int? httpCode,
  }) =>
      HomeReportResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        httpCode: httpCode ?? this.httpCode,
      );

  factory HomeReportResponse.fromJson(Map<String, dynamic> json) =>
      HomeReportResponse(
        status: json["status"],
        data: HomeReportData.fromJson(json["data"]),
        httpCode: json["httpCode"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "httpCode": httpCode,
      };
}

class HomeReportData {
  HomeReportData({
    required this.today,
    required this.yesterday,
    required this.newOrder,
  });

  int today;
  int yesterday;
  int newOrder;

  HomeReportData copyWith({
    int? today,
    int? yesterday,
    int? newOrder,
  }) =>
      HomeReportData(
        today: today ?? this.today,
        yesterday: yesterday ?? this.yesterday,
        newOrder: newOrder ?? this.newOrder,
      );

  factory HomeReportData.fromJson(Map<String, dynamic> json) => HomeReportData(
        today: json["today"],
        yesterday: json["yesterday"],
        newOrder: json["newOrder"],
      );

  Map<String, dynamic> toJson() => {
        "today": today,
        "yesterday": yesterday,
        "newOrder": newOrder,
      };
}
