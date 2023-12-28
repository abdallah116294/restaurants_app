// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:returants_app/Features/domain/entity/categories_entity.dart';
import 'package:returants_app/Features/domain/entity/custom_reviews_entity.dart';
import 'package:returants_app/Features/domain/entity/menus_entity.dart';

class Restaurant extends Equatable {
 final String id;
final  String name;
final  String description;
final  String city;
final  String address;
final  String pictureId;
 final List<CategoriesEntity> categories;
 final MenusEntity menus;
  dynamic rating;
 final List<CustomReviewsEntity> customerReviews;
  Restaurant({
   required this.id,
  required  this.name,
 required   this.description,
 required   this.city,
 required   this.address,
 required   this.pictureId,
 required   this.categories,
 required   this.menus,
   required this.rating,
  required  this.customerReviews,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    city,
    address,
    pictureId,
    categories,
    menus,
    rating,
    customerReviews
  ];
}
