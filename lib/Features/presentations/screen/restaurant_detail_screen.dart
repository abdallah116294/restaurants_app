import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:returants_app/Features/presentations/cubit/get_restaurants_cubit.dart';
import 'package:returants_app/Features/presentations/widgets/restaurants_detail_widget.dart';
import 'package:returants_app/injection_container.dart' as di;

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            di.sl<GetRestaurantsCubit>()..getRestaurantDetails(id),
        child: BlocBuilder<GetRestaurantsCubit, GetRestaurantsState>(
            builder: (context, state) {
          if (state is GetRestaurantDetailsIsloading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetRestaurantDetailsLoaded) {
            return RestaurantDetailWidget(
              customReviews: state.restaurnatDetailEntity.restaurant.customerReviews,
              imageUrl:
                  state.restaurnatDetailEntity.restaurant.pictureId.toString(),
              name: state.restaurnatDetailEntity.restaurant.name,
              ratings: state.restaurnatDetailEntity.restaurant.rating,
              address: state.restaurnatDetailEntity.restaurant.address,
              menu: state.restaurnatDetailEntity.restaurant.menus,
            );
          } else if (state is GetRestaurantDetailsError) {
            return Center(
              child: Text(state.message.toString()),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
