import 'dart:convert';

Respuesta respuestaFromJson(String str) => Respuesta.fromJson(json.decode(str));

String respuestaToJson(Respuesta data) => json.encode(data.toJson());

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

  factory Respuesta.fromJson(Map<String, dynamic> json) => Respuesta(
        title: json["title"],
        price: json["price"],
        image: json['sprites']['front_default'],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "image": image,
        "category": category,
      };
}
