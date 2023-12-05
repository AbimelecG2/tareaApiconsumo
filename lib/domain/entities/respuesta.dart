import 'dart:convert';

class Respuesta {
  String title;
  String price;
  String image;
  String category;

  Respuesta({
    required this.title,
    required this.price,
    required this.image,
    required this.category,
  });

  factory Respuesta.fromJson(Map<String, dynamic> json) {
    return Respuesta(
      title: json["title"],
      price: json["price"].toString(),
      image: json["image"],
      category: json["category"],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "image": image,
        "category": category,
      };
}
