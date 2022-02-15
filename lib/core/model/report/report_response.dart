// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ReportResponse welcomeFromJson(String str) =>
    ReportResponse.fromJson(json.decode(str));

String welcomeToJson(ReportResponse data) => json.encode(data.toJson());

class ReportResponse {
  ReportResponse({
    required this.status,
    required this.data,
    required this.httpCode,
  });

  int status;
  ReportDataResponse data;
  int httpCode;

  factory ReportResponse.fromJson(Map<String, dynamic> json) => ReportResponse(
        status: json["status"],
        data: ReportDataResponse.fromJson(json["data"]),
        httpCode: json["httpCode"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "httpCode": httpCode,
      };
}

class ReportDataResponse {
  ReportDataResponse({
    required this.records,
    required this.totalItems,
    required this.totalNumPage,
    required this.pageSize,
    required this.page,
    required this.limit,
    required this.skip,
  });

  List<ReportRecord> records;
  int totalItems;
  int totalNumPage;
  int pageSize;
  int page;
  int limit;
  int skip;

  factory ReportDataResponse.fromJson(Map<String, dynamic> json) =>
      ReportDataResponse(
        records: List<ReportRecord>.from(
            json["records"].map((x) => ReportRecord.fromJson(x))),
        totalItems: json["total_items"],
        totalNumPage: json["total_num_page"],
        pageSize: json["page_size"],
        page: json["page"],
        limit: json["limit"],
        skip: json["skip"],
      );

  Map<String, dynamic> toJson() => {
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
        "total_items": totalItems,
        "total_num_page": totalNumPage,
        "page_size": pageSize,
        "page": page,
        "limit": limit,
        "skip": skip,
      };
}

class ReportRecord {
  ReportRecord({
    required this.id,
    // required this.displayId,
    required this.totalQty,
    required this.totalPrice,
  });

  DateTime id;
  // String displayId;
  int totalQty;
  int totalPrice;

  factory ReportRecord.fromJson(Map<String, dynamic> json) => ReportRecord(
        id: DateTime.parse(json["_id"]),
        // displayId: json["displayId"],
        totalQty: json["totalQty"],
        totalPrice: json["totalPrice"],
      );

  Map<String, dynamic> toJson() => {
        "_id":
            "${id.year.toString().padLeft(4, '0')}-${id.month.toString().padLeft(2, '0')}-${id.day.toString().padLeft(2, '0')}",
        // "displayId": displayId,
        "totalQty": totalQty,
        "totalPrice": totalPrice,
      };
}
