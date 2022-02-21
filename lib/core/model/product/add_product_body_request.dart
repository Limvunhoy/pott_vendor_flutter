// To parse this JSON data, do
//
//     final addProductBodyRequest = addProductBodyRequestFromJson(jsonString);

import 'dart:convert';

import 'dart:math';

AddProductBodyRequest addProductBodyRequestFromJson(String str) =>
    AddProductBodyRequest.fromJson(json.decode(str));

String addProductBodyRequestToJson(AddProductBodyRequest data) =>
    json.encode(data.toJson());

class AddProductBodyRequest {
  AddProductBodyRequest({
    required this.name,
    required this.thumnail,
    required this.images,
    required this.description,
    required this.categoryId,
    required this.vendorId,
    required this.productOptions,
    required this.productVariance,
  });

  String name;
  String thumnail;
  List<String> images;
  String description;
  String categoryId;
  int vendorId;
  List<AddProductOption> productOptions;
  List<AddProductVariance> productVariance;

  AddProductBodyRequest copyWith({
    String? name,
    String? thumnail,
    List<String>? images,
    String? description,
    String? categoryId,
    int? vendorId,
    List<AddProductOption>? productOptions,
    List<AddProductVariance>? productVariance,
  }) =>
      AddProductBodyRequest(
        name: name ?? this.name,
        thumnail: thumnail ?? this.thumnail,
        images: images ?? this.images,
        description: description ?? this.description,
        categoryId: categoryId ?? this.categoryId,
        vendorId: vendorId ?? -1,
        productOptions: productOptions ?? this.productOptions,
        productVariance: productVariance ?? this.productVariance,
      );

  factory AddProductBodyRequest.fromJson(Map<String, dynamic> json) =>
      AddProductBodyRequest(
        name: json["name"],
        thumnail: json["thumnail"],
        images: List<String>.from(json["images"].map((x) => x)),
        description: json["description"],
        categoryId: json["categoryId"],
        vendorId: json["vendorId"],
        productOptions: List<AddProductOption>.from(
            json["productOptions"].map((x) => AddProductOption.fromJson(x))),
        productVariance: List<AddProductVariance>.from(
            json["productVariance"].map((x) => AddProductVariance.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "thumnail": thumnail,
        "images": List<dynamic>.from(images.map((x) => x)),
        "description": description,
        "categoryId": categoryId,
        "vendorId": vendorId,
        "productOptions":
            List<dynamic>.from(productOptions.map((x) => x.toJson())),
        "productVariance":
            List<dynamic>.from(productVariance.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return "{name: $name, thumbnail: $thumnail, image: $images, description: $description, categoryId: $categoryId, vendorId: $vendorId, productOptions: $productOptions, productVariance: $productVariance}";
  }
}

class AddProductOption {
  AddProductOption({
    required this.option,
    required this.productOptionValue,
  });

  String option;
  List<AddProductOptionValue> productOptionValue;

  AddProductOption copyWith({
    String? option,
    List<AddProductOptionValue>? productOptionValue,
  }) =>
      AddProductOption(
        option: option ?? this.option,
        productOptionValue: productOptionValue ?? this.productOptionValue,
      );

  factory AddProductOption.fromJson(Map<String, dynamic> json) =>
      AddProductOption(
        option: json["option"],
        productOptionValue: List<AddProductOptionValue>.from(
            json["productOptionValue"]
                .map((x) => AddProductOptionValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "option": option,
        "productOptionValue":
            List<dynamic>.from(productOptionValue.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return "{option: $option, productOptionValue: ${productOptionValue.toString()}";
  }
}

class AddProductOptionValue {
  AddProductOptionValue({
    required this.optionValue,
    required this.optionValueImageUrl,
  });

  String optionValue;
  String optionValueImageUrl;

  AddProductOptionValue copyWith({
    String? optionValue,
    String? optionValueImageUrl,
  }) =>
      AddProductOptionValue(
        optionValue: optionValue ?? this.optionValue,
        optionValueImageUrl: optionValueImageUrl ?? this.optionValueImageUrl,
      );

  factory AddProductOptionValue.fromJson(Map<String, dynamic> json) =>
      AddProductOptionValue(
        optionValue: json["optionValue"],
        optionValueImageUrl: json["optionValueImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "optionValue": optionValue,
        "optionValueImageUrl": optionValueImageUrl,
      };

  @override
  String toString() {
    return "{optionValue: $optionValue, optionValueImageUrl: $optionValueImageUrl}";
  }
}

class AddProductVariance {
  AddProductVariance({
    required this.combination,
    this.imageUrl,
    this.cost,
    this.price,
    this.quantity,
  });

  String combination;
  String? imageUrl;
  String? cost;
  String? price;
  String? quantity;

  AddProductVariance copyWith({
    String? combination,
    String? imageUrl,
    String? cost,
    String? price,
    String? quantity,
  }) =>
      AddProductVariance(
        combination: combination ?? this.combination,
        imageUrl: imageUrl ?? this.imageUrl,
        cost: cost ?? this.cost,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
      );

  factory AddProductVariance.fromJson(Map<String, dynamic> json) =>
      AddProductVariance(
        combination: json["combination"],
        imageUrl: json["imageUrl"],
        cost: json["cost"],
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "combination": combination,
        "imageUrl": imageUrl,
        "cost": cost,
        "price": price,
        "quantity": quantity,
      };

  @override
  String toString() {
    return "{combination: $combination, imageUrl: $imageUrl, cost: $cost, price: $price, quantity: $quantity)}";
  }
}
