// To parse this JSON data, do
//
//     final addProductBodyRequest = addProductBodyRequestFromJson(jsonString);

import 'dart:convert';

import 'dart:math';

import 'package:pott_vendor/core/model/product/product_response.dart';

AddProductBodyRequest addProductBodyRequestFromJson(String str) =>
    AddProductBodyRequest.fromJson(json.decode(str));

String addProductBodyRequestToJson(AddProductBodyRequest data) =>
    json.encode(data.toJson());

class AddProductBodyRequest {
  AddProductBodyRequest({
    this.id,
    required this.name,
    required this.thumbnail,
    required this.images,
    required this.description,
    required this.categoryId,
    required this.vendorId,
    required this.productOptions,
    required this.productVariance,
  });

  String? id;
  String name;
  List<String> thumbnail;
  List<String> images;
  String description;
  String categoryId;
  int vendorId;
  List<ProductOption> productOptions;
  List<ProductVariance> productVariance;

  AddProductBodyRequest copyWith({
    String? id,
    String? name,
    List<String>? thumbnail,
    List<String>? images,
    String? description,
    String? categoryId,
    int? vendorId,
    List<ProductOption>? productOptions,
    List<ProductVariance>? productVariance,
  }) =>
      AddProductBodyRequest(
        id: id ?? this.id,
        name: name ?? this.name,
        thumbnail: thumbnail ?? this.thumbnail,
        images: images ?? this.images,
        description: description ?? this.description,
        categoryId: categoryId ?? this.categoryId,
        vendorId: vendorId ?? -1,
        productOptions: productOptions ?? this.productOptions,
        productVariance: productVariance ?? this.productVariance,
      );

  factory AddProductBodyRequest.fromJson(Map<String, dynamic> json) =>
      AddProductBodyRequest(
        id: json["_id"],
        name: json["name"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
        description: json["description"],
        categoryId: json["categoryId"],
        vendorId: json["vendorId"],
        productOptions: List<ProductOption>.from(
            json["productOptions"].map((x) => ProductOption.fromJson(x))),
        // productVariance: List<AddProductVariance>.from(
        //   json["productVariance"].map(
        //     (x) => AddProductVariance.fromJson(x),
        //   ),
        // ),
        productVariance: List<ProductVariance>.from(
          json["productVariance"].map(
            (x) => ProductVariance.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "thumbnail": thumbnail,
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
    return "{_id: $id, name: $name, thumbnail: $thumbnail, image: $images, description: $description, categoryId: $categoryId, vendorId: $vendorId, productOptions: ${productOptions.toString()}, productVariance: ${productVariance.toString()}}";
  }
}

// class AddProductOption {
//   AddProductOption({
//     required this.option,
//     required this.productOptionValue,
//   });
//
//   String option;
//   List<AddProductOptionValue> productOptionValue;
//
//   AddProductOption copyWith({
//     String? option,
//     List<AddProductOptionValue>? productOptionValue,
//   }) =>
//       AddProductOption(
//         option: option ?? this.option,
//         productOptionValue: productOptionValue ?? this.productOptionValue,
//       );
//
//   factory AddProductOption.fromJson(Map<String, dynamic> json) =>
//       AddProductOption(
//         option: json["option"],
//         productOptionValue: List<AddProductOptionValue>.from(
//             json["productOptionValue"]
//                 .map((x) => AddProductOptionValue.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "option": option,
//         "productOptionValue":
//             List<dynamic>.from(productOptionValue.map((x) => x.toJson())),
//       };
//
//   @override
//   String toString() {
//     return "{option: $option, productOptionValue: ${productOptionValue.toString()}";
//   }
// }

// class AddProductOptionValue {
//   AddProductOptionValue({
//     required this.optionValue,
//     required this.optionValueImageUrl,
//   });
//
//   String optionValue;
//   String optionValueImageUrl;
//
//   AddProductOptionValue copyWith({
//     String? optionValue,
//     String? optionValueImageUrl,
//   }) =>
//       AddProductOptionValue(
//         optionValue: optionValue ?? this.optionValue,
//         optionValueImageUrl: optionValueImageUrl ?? this.optionValueImageUrl,
//       );
//
//   factory AddProductOptionValue.fromJson(Map<String, dynamic> json) =>
//       AddProductOptionValue(
//         optionValue: json["optionValue"],
//         optionValueImageUrl: json["optionValueImageUrl"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "optionValue": optionValue,
//         "optionValueImageUrl": optionValueImageUrl,
//       };
//
//   @override
//   String toString() {
//     return "{optionValue: $optionValue, optionValueImageUrl: $optionValueImageUrl}";
//   }
// }
//
// class AddProductVariance {
//   AddProductVariance({
//     required this.combination,
//     this.imageUrl,
//     this.cost,
//     this.price,
//     this.quantity,
//   });
//
//   String combination;
//   String? imageUrl;
//   String? cost;
//   String? price;
//   String? quantity;
//
//   AddProductVariance copyWith({
//     String? combination,
//     String? imageUrl,
//     String? cost,
//     String? price,
//     String? quantity,
//   }) =>
//       AddProductVariance(
//         combination: combination ?? this.combination,
//         imageUrl: imageUrl ?? this.imageUrl,
//         cost: cost ?? this.cost,
//         price: price ?? this.price,
//         quantity: quantity ?? this.quantity,
//       );
//
//   factory AddProductVariance.fromJson(Map<String, dynamic> json) =>
//       AddProductVariance(
//         combination: json["combination"],
//         imageUrl: json["imageUrl"],
//         cost: json["cost"],
//         price: json["price"],
//         quantity: json["quantity"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "combination": combination,
//         "imageUrl": imageUrl,
//         "cost": cost,
//         "price": price,
//         "quantity": quantity,
//       };
//
//   @override
//   String toString() {
//     return "{combination: $combination, imageUrl: $imageUrl, cost: $cost, price: $price, quantity: $quantity)}";
//   }
// }
