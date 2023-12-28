import 'package:returants_app/Features/domain/entity/menus_entity.dart';

class MenusModel extends MenusEntity {
  const MenusModel({required super.foods, required super.drinks});
  factory MenusModel.fromJson(Map<String, dynamic> json) {
    List<FoodModel> foods =
        (json["foods"] as List).map((e) => FoodModel.fromJson(e)).toList();
    List<DrinksModel> drinks =
        (json["foods"] as List).map((e) => DrinksModel.fromJson(e)).toList();
    return MenusModel(foods: foods, drinks: drinks);
  }
}

class FoodModel extends Foods {
  const FoodModel({required super.name});
  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(name: json['name']);
  }
}

class DrinksModel extends Drinks {
  const DrinksModel({required super.name});
  factory DrinksModel.fromJson(Map<String, dynamic> json) {
    return DrinksModel(name: json['name']);
  }
}
