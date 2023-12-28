import 'package:returants_app/Features/data/model/categories_model.dart';
import 'package:returants_app/Features/data/model/custom_reviews_model.dart';
import 'package:returants_app/Features/data/model/menus_model.dart';
import 'package:returants_app/Features/domain/entity/restaurant_entity.dart';

class RestaurantModel extends Restaurant {
  RestaurantModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.city,
      required super.address,
      required super.pictureId,
      required super.categories,
      required super.menus,
      required super.rating,
      required super.customerReviews});
  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    List<CategoriesModel> categories = (json["categories"] as List<dynamic>)
        .map((e) => CategoriesModel.formjson(e))
        .toList();
    List<CustomReviewsModel> customerReviews = (json["customerReviews"] as List<dynamic>)
        .map((e) => CustomReviewsModel.fromJson(e))
        .toList();
    return RestaurantModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        city: json['city'],
        address: json['address'],
        pictureId: json['pictureId'],
        categories: categories,
      //  categories: json['categories']!=null?(json["categories"] as List<dynamic>).map((e) => CategoriesModel.formjson(e)).toList():null,
        menus: MenusModel.fromJson(json),
        rating: json['rating'],
        customerReviews: customerReviews
      //  customerReviews:json['customerReviews']!=null?(json["customerReviews"] as List<dynamic>).map((e) => CustomReviewsModel.fromJson(e)).toList():null
         );
  }
}
