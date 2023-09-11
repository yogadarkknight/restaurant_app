
import 'dart:convert';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
        menus:  Menus.fromJson(json["menus"])
      );
}
class Menus {
  final List<Drink> foods;
  final List<Drink> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    foods: List<Drink>.from(json["foods"].map((x) => Drink.fromJson(x))),
    drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
    "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
  };
}

class Drink {
  final String name;

  Drink({
    required this.name,
  });

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
    name: json["name"],
  );

  Map<String?, dynamic> toJson() => {
    "name": name,
  };
}

  List<Restaurant> parseRestaurants(String? json) {
    if (json == null) {
      return [];
    }

    final List parsed = jsonDecode(json)["restaurants"];
    return parsed.map((json) => Restaurant.fromJson(json)).toList();
  }


