class Restaurant {
  final bool error;
  final String message;
  final RestaurantDetail restaurant;

  Restaurant({required this.error, required this.message, required this.restaurant});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      error: json['error'] as bool,
      message: json['message'] as String,
      restaurant: RestaurantDetail.fromJson(json['restaurant']),
    );
  }
}

class RestaurantDetail {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Category> categories;
  final Menu menus;
  final double rating;
  final List<CustomerReview> customerReviews;

  RestaurantDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) {
    List<dynamic> categoriesList = json['categories'];
    List<dynamic> reviewsList = json['customerReviews'];

    List<Category> categories = categoriesList.map((category) => Category.fromJson(category)).toList();
    List<CustomerReview> reviews = reviewsList.map((review) => CustomerReview.fromJson(review)).toList();

    return RestaurantDetail(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      city: json['city'] as String,
      address: json['address'] as String,
      pictureId: json['pictureId'] as String,
      categories: categories,
      menus: Menu.fromJson(json['menus']),
      rating: (json['rating'] as num).toDouble(),
      customerReviews: reviews,
    );
  }
}

class Category {
  final String name;

  Category({required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'] as String,
    );
  }
}

class Menu {
  final List<MenuItem> foods;
  final List<MenuItem> drinks;

  Menu({required this.foods, required this.drinks});

  factory Menu.fromJson(Map<String, dynamic> json) {
    List<dynamic> foodList = json['foods'];
    List<dynamic> drinkList = json['drinks'];

    List<MenuItem> foods = foodList.map((food) => MenuItem.fromJson(food)).toList();
    List<MenuItem> drinks = drinkList.map((drink) => MenuItem.fromJson(drink)).toList();

    return Menu(foods: foods, drinks: drinks);
  }
}

class MenuItem {
  final String name;

  MenuItem({required this.name});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      name: json['name'] as String,
    );
  }
}

class CustomerReview {
  final String name;
  final String review;
  final String date;

  CustomerReview({required this.name, required this.review, required this.date});

  factory CustomerReview.fromJson(Map<String, dynamic> json) {
    return CustomerReview(
      name: json['name'] as String,
      review: json['review'] as String,
      date: json['date'] as String,
    );
  }
}
