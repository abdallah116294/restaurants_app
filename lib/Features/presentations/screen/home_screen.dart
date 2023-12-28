import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:returants_app/Features/presentations/cubit/get_restaurants_cubit.dart';
import 'package:returants_app/Features/presentations/screen/search_screen.dart';
import 'package:returants_app/Features/presentations/widgets/restaurants_widget.dart';
import 'package:returants_app/injection_container.dart' as di;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchScreen()));
                },
                icon: const Icon(Icons.search))
          ],
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
              icon: const Icon(Icons.account_circle), onPressed: () {}),
          title: const Text("Food Delivery App"),
        ),
        body: Column(
          children: [
            BlocProvider(
              create: (context) =>
                  di.sl<GetRestaurantsCubit>()..getRestaurants(),
              child: BlocBuilder<GetRestaurantsCubit, GetRestaurantsState>(
                  builder: (context, state) {
                if (state is GetRestaurantsIsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetRestaurantsLoadedState) {
                  return Expanded(
                    child: ListView.separated(
                        controller: _controller,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return RestaurantsWidget(
                            id: state
                                .restaurantDataEntity.restaurants![index].id
                                .toString(),
                            restaurant_name: state
                                .restaurantDataEntity.restaurants![index].name
                                .toString(),
                            restaurant_city: state
                                .restaurantDataEntity.restaurants![index].city
                                .toString(),
                            imageUrl: state.restaurantDataEntity
                                .restaurants![index].pictureId!
                                .toString(),
                            restaurant_rating: state.restaurantDataEntity
                                .restaurants![index].rating!
                                .toDouble(),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount:
                            state.restaurantDataEntity.restaurants!.length),
                  );
                } else if (state is GetRestaurantsErrorState) {
                  return Center(
                    child: Text(state.error.toString()),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
            )
          ],
        ));
  }
}
