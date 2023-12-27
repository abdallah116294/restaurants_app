import 'package:flutter/material.dart';
import 'package:returants_app/Features/presentations/widgets/ratings_stars.dart';

class RestaurantsWidget extends StatelessWidget {
  const RestaurantsWidget(
      {super.key,
      required this.restaurant_name,
      required this.restaurant_city,
      required this.imageUrl,
      required this.restaurant_rating
      });
  final String restaurant_name;
  final String restaurant_city;
  final String imageUrl;
  final int restaurant_rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            width: 1.0,
            // color: Colors.grey[200],
            color: Colors.grey),
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Hero(
              tag: "https://restaurant-api.dicoding.dev/images/small/" +
                  imageUrl,
              child: Image(
                height: 150.0,
                width: 150.0,
                image: NetworkImage(
                    "https://restaurant-api.dicoding.dev/images/small/" +
                        imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    restaurant_name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  RatingStars(restaurant_rating),
                  const SizedBox(height: 4.0),
                  Text(
                    restaurant_city,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  const Text(
                    '0.2 miles away',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
