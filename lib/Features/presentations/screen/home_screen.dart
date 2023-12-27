import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:returants_app/Features/presentations/cubit/get_restaurants_cubit.dart';
import 'package:returants_app/Features/presentations/widgets/restaurants_widget.dart';
import 'package:returants_app/injection_container.dart' as di;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.account_circle), onPressed: () {}),
          title: const Text("Food Delivery App"),
        ),
        body: ListView(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 150.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(width: .8)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          width: .8, color: Theme.of(context).primaryColor)),
                  hintText: "Search Restaurants",
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _searchController.clear();
                        });
                      },
                      icon: const Icon(Icons.clear))),
            ),
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
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return RestaurantsWidget(
                            restaurant_name: state
                                .restaurantDataEntity.restaurants![index].name
                                .toString(),
                            restaurant_city: state
                                .restaurantDataEntity.restaurants![index].city
                                .toString(),
                            imageUrl: state.restaurantDataEntity
                                .restaurants![index].pictureId
                                .toString());
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount:
                          state.restaurantDataEntity.restaurants!.length);
                }else if(state is GetRestaurantsErrorState){
                  return const  Center(
                    child: CircularProgressIndicator(),
                  );
                }
              return  const  Center(
                    child: CircularProgressIndicator(),
                  );
              }
              ),
            )
          ],
        ));
  }
}
