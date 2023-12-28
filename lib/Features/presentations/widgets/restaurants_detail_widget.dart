import 'package:flutter/material.dart';
import 'package:returants_app/Features/presentations/widgets/menu_item_widget.dart';
import 'package:returants_app/Features/presentations/widgets/ratings_stars.dart';

class RestaurantDetailWidget extends StatefulWidget {
  const RestaurantDetailWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.ratings,
    required this.address,
    required this.menu,
    required this.customReviews,
  });
  final String imageUrl;
  final String name;
  final double ratings;
  final String address;
  final menu;
  final List customReviews;

  @override
  State<RestaurantDetailWidget> createState() => _RestaurantDetailWidgetState();
}

class _RestaurantDetailWidgetState extends State<RestaurantDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Hero(
              tag: widget.imageUrl,
              child: Image(
                height: 220.0,
                width: MediaQuery.of(context).size.width,
                image: NetworkImage(
                    "https://restaurant-api.dicoding.dev/images/small/${widget.imageUrl}"),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    iconSize: 30.0,
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    color: Theme.of(context).primaryColor,
                    iconSize: 35.0,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    '0.2 miles away',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              RatingStars(widget.ratings),
              const SizedBox(height: 6.0),
              Text(
                widget.address,
                style: const TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return   Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                 Text(widget.customReviews[index].name.toString()),
                                 Text(widget.customReviews[index].review),
                                Text(widget.customReviews[index].date,style:const  TextStyle(overflow: TextOverflow.ellipsis),)
                              ],
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: widget.customReviews.length);
                    });
              },
              child: const Text(
                'Reviews',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onPressed: () {},
              child: const Text(
                'Contact',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10.0),
        const Text(
          'Foods',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 100/20,
            padding: const EdgeInsets.all(20),
            children: List.generate(widget.menu.foods.length, (index) {
              return MenuItemWidget(
                menuItem: widget.menu.foods[index].name, imageUrl: "https://restaurant-api.dicoding.dev/images/small/"+widget.imageUrl,
              );
            }),
          ),
        ),
        const Text(
          'Drinks',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        Expanded(
          child: Expanded(
            child: GridView.count(
              crossAxisSpacing: 100/20,
              crossAxisCount: 2,
              padding: const EdgeInsets.all(20),
              children: List.generate(widget.menu.drinks.length, (index) {
                return MenuItemWidget(
                  menuItem: widget.menu.drinks[index].name, imageUrl: 'https://restaurant-api.dicoding.dev/images/small/'+widget.imageUrl,
                );
              }),
            ),
          ),
        )
      ],
    );
  }
}
