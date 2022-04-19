// To parse this JSON data, do
//
//     final productResponse = productResponseFromJson(jsonString);

import 'dart:convert';

ProductResponse productResponseFromJson(String str) =>
    ProductResponse.fromJson(json.decode(str));

String productResponseToJson(ProductResponse data) =>
    json.encode(data.toJson());

class ProductResponse {
  ProductResponse({
    required this.status,
    required this.data,
    required this.httpCode,
  });

  int status;
  ProductDataResponse data;
  int httpCode;

  ProductResponse copyWith({
    int? status,
    ProductDataResponse? data,
    int? httpCode,
  }) =>
      ProductResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        httpCode: httpCode ?? this.httpCode,
      );

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        status: json["status"],
        data: ProductDataResponse.fromJson(json["data"]),
        httpCode: json["httpCode"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "httpCode": httpCode,
      };
}

class ProductDataResponse {
  ProductDataResponse({
    required this.records,
    required this.totalItems,
    required this.totalNumPage,
    required this.pageSize,
    required this.page,
    required this.limit,
    required this.skip,
  });

  List<ProductRecord> records;
  int totalItems;
  int totalNumPage;
  int pageSize;
  int page;
  int limit;
  int skip;

  ProductDataResponse copyWith({
    List<ProductRecord>? records,
    int? totalItems,
    int? totalNumPage,
    int? pageSize,
    int? page,
    int? limit,
    int? skip,
  }) =>
      ProductDataResponse(
        records: records ?? this.records,
        totalItems: totalItems ?? this.totalItems,
        totalNumPage: totalNumPage ?? this.totalNumPage,
        pageSize: pageSize ?? this.pageSize,
        page: page ?? this.page,
        limit: limit ?? this.limit,
        skip: skip ?? this.skip,
      );

  factory ProductDataResponse.fromJson(Map<String, dynamic> json) =>
      ProductDataResponse(
        records: List<ProductRecord>.from(
            json["records"].map((x) => ProductRecord.fromJson(x))),
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

class ProductRecord {
  ProductRecord({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.images,
    required this.description,
    required this.cost,
    required this.salePrice,
    required this.type,
    required this.status,
    required this.createdAt,
    required this.category,
    this.vendor,
    required this.productOptions,
    required this.productVariance,
    required this.totalStock,
  });

  String id;
  String name;
  List<String> thumbnail;
  List<String> images;
  String description;
  int cost;
  int salePrice;
  String type;
  String status;
  int createdAt;
  Category? category;
  Vendor? vendor;
  List<ProductOption> productOptions;
  List<ProductVariance> productVariance;
  int? totalStock;

  ProductRecord copyWith({
    String? id,
    String? name,
    List<String>? thumbnail,
    List<String>? images,
    String? description,
    int? cost,
    int? salePrice,
    String? type,
    String? status,
    int? createdAt,
    Category? category,
    Vendor? vendor,
    List<ProductOption>? productOptions,
    List<ProductVariance>? productVariance,
    int? totalStock,
  }) =>
      ProductRecord(
        id: id ?? this.id,
        name: name ?? this.name,
        thumbnail: thumbnail ?? this.thumbnail,
        images: images ?? this.images,
        description: description ?? this.description,
        cost: cost ?? this.cost,
        salePrice: salePrice ?? this.salePrice,
        type: type ?? this.type,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        category: category ?? this.category,
        vendor: vendor ?? this.vendor,
        productOptions: productOptions ?? this.productOptions,
        productVariance: productVariance ?? this.productVariance,
        totalStock: totalStock ?? this.totalStock,
      );

  factory ProductRecord.fromJson(Map<String, dynamic> json) => ProductRecord(
        id: json["_id"],
        name: json["name"],
        thumbnail: List<String>.from(json["thumbnail"].map((x) => x)),
        images: List<String>.from(json["images"].map((x) => x)),
        description: json["description"],
        cost: json["cost"],
        salePrice: json["salePrice"],
        type: json["type"],
        status: json["status"],
        createdAt: json["createdAt"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
        productOptions: List<ProductOption>.from(
            json["productOptions"].map((x) => ProductOption.fromJson(x))),
        productVariance: List<ProductVariance>.from(
            json["productVariance"].map((x) => ProductVariance.fromJson(x))),
        totalStock: json["totalStock"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "thumbnail": List<dynamic>.from(thumbnail.map((x) => x)),
        "images": List<dynamic>.from(images.map((x) => x)),
        "description": description,
        "cost": cost,
        "salePrice": salePrice,
        "type": type,
        "status": status,
        "createdAt": createdAt,
        "category": category == null ? null : category!.toJson(),
        "vendor": vendor == null ? null : vendor!.toJson(),
        "productOptions":
            List<dynamic>.from(productOptions.map((x) => x.toJson())),
        "productVariance":
            List<dynamic>.from(productVariance.map((x) => x.toJson())),
        "totalStock": totalStock,
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.parentId,
    required this.status,
  });

  String id;
  String name;
  String parentId;
  String status;

  Category copyWith({
    String? id,
    String? name,
    String? parentId,
    String? status,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        parentId: parentId ?? this.parentId,
        status: status ?? this.status,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        parentId: json["parentId"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "parentId": parentId,
        "status": status,
      };
}

class ProductOption {
  ProductOption({
    required this.id,
    required this.option,
    required this.productOptionValue,
    required this.productId,
  });

  String id;
  String option;
  List<ProductOptionValue> productOptionValue;
  String productId;

  ProductOption copyWith({
    String? id,
    String? option,
    List<ProductOptionValue>? productOptionValue,
    String? productId,
  }) =>
      ProductOption(
        id: id ?? this.id,
        option: option ?? this.option,
        productOptionValue: productOptionValue ?? this.productOptionValue,
        productId: productId ?? this.productId,
      );

  factory ProductOption.fromJson(Map<String, dynamic> json) => ProductOption(
        id: json["_id"],
        option: json["option"],
        productOptionValue: List<ProductOptionValue>.from(
            json["productOptionValue"]
                .map((x) => ProductOptionValue.fromJson(x))),
        productId: json["productId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "option": option,
        "productOptionValue":
            List<dynamic>.from(productOptionValue.map((x) => x.toJson())),
        "productId": productId,
      };
}

class ProductOptionValue {
  ProductOptionValue({
    required this.optionValue,
    required this.optionValueImageUrl,
  });

  String optionValue;
  String optionValueImageUrl;

  ProductOptionValue copyWith({
    String? optionValue,
    String? optionValueImageUrl,
  }) =>
      ProductOptionValue(
        optionValue: optionValue ?? this.optionValue,
        optionValueImageUrl: optionValueImageUrl ?? this.optionValueImageUrl,
      );

  factory ProductOptionValue.fromJson(Map<String, dynamic> json) =>
      ProductOptionValue(
        optionValue: json["optionValue"],
        optionValueImageUrl: json["optionValueImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "optionValue": optionValue,
        "optionValueImageUrl": optionValueImageUrl,
      };
}

class ProductVariance {
  ProductVariance({
    required this.id,
    required this.combination,
    required this.imageUrl,
    required this.cost,
    required this.price,
    required this.quantity,
    required this.productId,
  });

  String id;
  String combination;
  String imageUrl;
  int cost;
  int price;
  int quantity;
  String productId;

  ProductVariance copyWith({
    String? id,
    String? combination,
    String? imageUrl,
    int? cost,
    int? price,
    int? quantity,
    String? productId,
  }) =>
      ProductVariance(
        id: id ?? this.id,
        combination: combination ?? this.combination,
        imageUrl: imageUrl ?? this.imageUrl,
        cost: cost ?? this.cost,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        productId: productId ?? this.productId,
      );

  factory ProductVariance.fromJson(Map<String, dynamic> json) =>
      ProductVariance(
        id: json["_id"],
        combination: json["combination"],
        imageUrl: json["imageUrl"],
        cost: json["cost"],
        price: json["price"],
        quantity: json["quantity"],
        productId: json["productId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "combination": combination,
        "imageUrl": imageUrl,
        "cost": cost,
        "price": price,
        "quantity": quantity,
        "productId": productId,
      };
}

class Vendor {
  Vendor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.vendorId,
  });

  String id;
  String firstName;
  String lastName;
  int vendorId;

  Vendor copyWith({
    String? id,
    String? firstName,
    String? lastName,
    int? vendorId,
  }) =>
      Vendor(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        vendorId: vendorId ?? this.vendorId,
      );

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
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
