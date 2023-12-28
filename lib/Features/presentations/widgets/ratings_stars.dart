import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rating;

  RatingStars(dynamic rating, {Key? key})
      : rating = rating is int ? rating.toDouble() : rating,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐  ';
    }
    stars.trim();
    return Text(
      stars,
      style: const TextStyle(
        fontSize: 18.0,
      ),
    );
  }
}
