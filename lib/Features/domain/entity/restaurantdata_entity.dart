import 'package:equatable/equatable.dart';
import 'package:returants_app/Features/domain/entity/restaurants_entity.dart';

class RestaurantDataEntity extends Equatable {
  bool? error;
  String? message;
  dynamic count;
  List<Restaurants>? restaurants;
  RestaurantDataEntity(
      {required this.error, required this.message, required this.restaurants,required this.count});
  @override

  List<Object?> get props => [
    error,
    message,
    count,
    restaurants
  ];
}
// class RestaurantsData {
//   bool? error;
//   String? message;
//   int? count;
//   List<Restaurants2>? restaurants;

//   RestaurantsData({this.error, this.message, this.count, this.restaurants});

//   RestaurantsData.fromJson(Map<String, dynamic> json) {
//     error = json['error'];
//     message = json['message'];
//     count = json['count'];
//     if (json['restaurants'] != null) {
//       restaurants = <Restaurants2>[];
//       json['restaurants'].forEach((v) {
//         restaurants!.add(new Restaurants2.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['error'] = error;
//     data['message'] = message;
//     data['count'] = count;
//     if (restaurants != null) {
//       data['restaurants'] = restaurants!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Restaurants2 {
//   String? id;
//   String? name;
//   String? description;
//   String? pictureId;
//   String? city;
//   dynamic rating;

//   Restaurants2(
//       {this.id,
//       this.name,
//       this.description,
//       this.pictureId,
//       this.city,
//       this.rating});

//   Restaurants2.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     pictureId = json['pictureId'];
//     city = json['city'];
//     rating = json['rating'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['description'] = description;
//     data['pictureId'] = pictureId;
//     data['city'] = city;
//     data['rating'] = rating;
//     return data;
//   }
// }