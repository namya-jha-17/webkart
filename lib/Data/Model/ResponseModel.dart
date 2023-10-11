import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

Welcome3 welcome3FromJson(String str) => Welcome3.fromJson(json.decode(str));

String welcome3ToJson(Welcome3 data) => json.encode(data.toJson());

class Welcome3 {
  Welcome3({
    required this.products,
  });

  List<Product> products;

  factory Welcome3.fromJson(Map<String, dynamic> json) => Welcome3(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}


@JsonSerializable()
class Product {
  Product(this.quantity,{
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  // required this.quantity
  });
  int quantity=1;
  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;


  factory Product.fromJson(Map<String, dynamic> json) => Product(
   1,
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    discountPercentage: json["discountPercentage"].toDouble(),
    rating: json["rating"].toDouble(),
    stock: json["stock"],
    brand: json["brand"],
    category: json["category"],
    thumbnail: json["thumbnail"],
    images: List<String>.from(json["images"].map((x) => x)),

  );

  Map<String, dynamic> toJson() => {

    "id": id,
    "title": title,
    "description": description,
    "price": price,
    "discountPercentage": discountPercentage,
    "rating": rating,
    "stock": stock,
    "brand": brand,
    "category": category,
    "thumbnail": thumbnail,
    "images": List<dynamic>.from(images.map((x) => x)),
    // "images": List<dynamic>.from(images.map((x) => x)),
  };
}
