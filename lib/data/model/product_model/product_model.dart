// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String id;
  String rate;
  String name;
  bool isFavourite;
  String image;
  String description;
  String status;

  ProductModel({
    required this.id,
    required this.rate,
    required this.name,
    required this.isFavourite,
    required this.image,
    required this.description,
    required this.status,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    rate: json["rate"],
    name: json["name"],
    isFavourite: json["isFavourite"],
    image: json["image"],
    description: json["description"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rate": rate,
    "name": name,
    "isFavourite": isFavourite,
    "image": image,
    "description": description,
    "status": status,
  };
}
