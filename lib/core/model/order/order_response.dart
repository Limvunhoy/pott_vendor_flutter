// To parse this JSON data, do
//
//     final orderResponse = orderResponseFromJson(jsonString);

import 'dart:convert';

OrderResponse orderResponseFromJson(String str) =>
    OrderResponse.fromJson(json.decode(str));

String orderResponseToJson(OrderResponse data) => json.encode(data.toJson());

class OrderResponse {
  OrderResponse({
    required this.status,
    required this.data,
    required this.httpCode,
  });

  final int status;
  final OrderDataResponse data;
  final int httpCode;

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
        status: json["status"],
        data: OrderDataResponse.fromJson(json["data"]),
        httpCode: json["httpCode"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "httpCode": httpCode,
      };
}

class OrderDataResponse {
  OrderDataResponse({
    required this.records,
    required this.totalItems,
    required this.totalNumPage,
    required this.pageSize,
    required this.page,
    required this.limit,
    required this.skip,
  });

  final List<OrderRecordResponse> records;
  final int totalItems;
  final int totalNumPage;
  final int pageSize;
  final int page;
  final int limit;
  final int skip;

  factory OrderDataResponse.fromJson(Map<String, dynamic> json) =>
      OrderDataResponse(
        records: List<OrderRecordResponse>.from(
            json["records"].map((x) => OrderRecordResponse.fromJson(x))),
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

class OrderRecordResponse {
  OrderRecordResponse({
    required this.id,
    required this.itemList,
    this.delivery,
    required this.displayId,
    required this.timeLine,
    required this.vendor,
    required this.totalQty,
    required this.totalPrice,
  });

  final String id;
  final List<OrderItemListResponse> itemList;
  final OrderDeliveryResponse? delivery;
  final String displayId;
  final OrderTimeLineResponse timeLine;
  final OrderVendorResponse vendor;
  final int totalQty;
  final int totalPrice;

  factory OrderRecordResponse.fromJson(Map<String, dynamic> json) =>
      OrderRecordResponse(
        id: json["_id"],
        itemList: List<OrderItemListResponse>.from(
            json["itemList"].map((x) => OrderItemListResponse.fromJson(x))),
        delivery: json["delivery"] == null
            ? null
            : OrderDeliveryResponse.fromJson(json["delivery"]),
        displayId: json["displayId"],
        timeLine: OrderTimeLineResponse.fromJson(json["timeLine"]),
        vendor: OrderVendorResponse.fromJson(json["vendor"]),
        totalQty: json["totalQty"],
        totalPrice: json["totalPrice"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "itemList": List<dynamic>.from(itemList.map((x) => x.toJson())),
        "delivery": delivery == null ? null : delivery?.toJson(),
        "displayId": displayId,
        "timeLine": timeLine.toJson(),
        "vendor": vendor.toJson(),
        "totalQty": totalQty,
        "totalPrice": totalPrice,
      };
}

class OrderDeliveryResponse {
  OrderDeliveryResponse({
    required this.driverName,
    required this.phone,
    required this.amount,
  });

  final String driverName;
  final String phone;
  final int amount;

  factory OrderDeliveryResponse.fromJson(Map<String, dynamic> json) =>
      OrderDeliveryResponse(
        driverName: json["driverName"],
        phone: json["phone"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "driverName": driverName,
        "phone": phone,
        "amount": amount,
      };
}

class OrderItemListResponse {
  OrderItemListResponse({
    required this.qty,
    required this.name,
    required this.image,
    required this.description,
    required this.cost,
    required this.salePrice,
    required this.status,
    required this.productVariance,
    required this.category,
  });

  final int qty;
  final String name;
  final String image;
  final String description;
  final int cost;
  final int salePrice;
  final String status;
  final OrderProductVarianceResponse productVariance;
  final OrderCategoryResponse category;

  factory OrderItemListResponse.fromJson(Map<String, dynamic> json) =>
      OrderItemListResponse(
        qty: json["qty"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        cost: json["cost"],
        salePrice: json["salePrice"],
        status: json["status"],
        productVariance:
            OrderProductVarianceResponse.fromJson(json["productVariance"]),
        category: OrderCategoryResponse.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "qty": qty,
        "name": name,
        "image": image,
        "description": description,
        "cost": cost,
        "salePrice": salePrice,
        "status": status,
        "productVariance": productVariance.toJson(),
        "category": category.toJson(),
      };
}

class OrderCategoryResponse {
  OrderCategoryResponse({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory OrderCategoryResponse.fromJson(Map<String, dynamic> json) =>
      OrderCategoryResponse(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}

class OrderProductVarianceResponse {
  OrderProductVarianceResponse({
    required this.id,
    required this.combination,
    required this.imageUrl,
    required this.price,
  });

  final String id;
  final String combination;
  final String imageUrl;
  final int price;

  factory OrderProductVarianceResponse.fromJson(Map<String, dynamic> json) =>
      OrderProductVarianceResponse(
        id: json["_id"],
        combination: json["combination"],
        imageUrl: json["imageUrl"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "combination": combination,
        "imageUrl": imageUrl,
        "price": price,
      };
}

class OrderTimeLineResponse {
  OrderTimeLineResponse({
    required this.newAt,
    required this.confirmAt,
    required this.readyAt,
    required this.completedAt,
  });

  final DateTime? newAt;
  final DateTime? confirmAt;
  final DateTime? readyAt;
  final DateTime? completedAt;

  factory OrderTimeLineResponse.fromJson(Map<String, dynamic> json) =>
      OrderTimeLineResponse(
        newAt: DateTime.parse(json["newAt"]),
        confirmAt: json["confirmAt"] == null
            ? null
            : DateTime.parse(json["confirmAt"]),
        readyAt:
            json["readyAt"] == null ? null : DateTime.parse(json["readyAt"]),
        completedAt: json["completedAt"] == null
            ? null
            : DateTime.parse(json["completedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "newAt": newAt?.toIso8601String(),
        "confirmAt": confirmAt == null ? null : confirmAt?.toIso8601String(),
        "readyAt": readyAt == null ? null : readyAt?.toIso8601String(),
        "completedAt":
            completedAt == null ? null : completedAt?.toIso8601String(),
      };
}

class OrderVendorResponse {
  OrderVendorResponse({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.vendorId,
  });

  final String id;
  final String firstName;
  final String lastName;
  final int vendorId;

  factory OrderVendorResponse.fromJson(Map<String, dynamic> json) =>
      OrderVendorResponse(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        vendorId: json["vendorId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "vendorId": vendorId,
      };
}
