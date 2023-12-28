import 'package:returants_app/Features/domain/entity/categories_entity.dart';

class CategoriesModel extends CategoriesEntity {
  CategoriesModel({required super.name});
  factory CategoriesModel.formjson(Map<String, dynamic> json) {
    return CategoriesModel(name: json['name']);
  }
}
