import 'package:equatable/equatable.dart';

class Restaurants extends Equatable {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  dynamic? rating;
  Restaurants(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating});
  @override
  
  List<Object?> get props => [
    id,
    name,
    description,
    pictureId,
    city,
    rating
  ];
}
