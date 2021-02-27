import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.id,
    this.title,
    this.value,
    this.available,
    this.photoUrl,
  });

  String id;
  String title;
  double value;
  bool available;
  String photoUrl;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        value: json["value"].toDouble(),
        available: json["available"],
        photoUrl: json["photoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "value": value,
        "available": available,
        "photoUrl": photoUrl,
      };

  copyValues(ProductModel product) {
    id = product.id;
    title = product.title;
    available = product.available;
    photoUrl = product.photoUrl;
    value = product.value;
  }
}
