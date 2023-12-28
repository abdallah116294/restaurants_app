import 'package:returants_app/Features/domain/entity/custom_reviews_entity.dart';

class CustomReviewsModel extends CustomReviewsEntity {
  const CustomReviewsModel(
      {required super.name, required super.review, required super.date});
  factory CustomReviewsModel.fromJson(Map<String, dynamic> json) {
    return CustomReviewsModel(
        name: json['name'], review: json['review'], date: json['date']);
  }
}
