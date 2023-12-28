import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:returants_app/Features/presentations/cubit/get_restaurants_cubit.dart';
import 'package:returants_app/Features/presentations/widgets/restaurants_widget.dart';
import 'package:returants_app/injection_container.dart' as di;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Search Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              onSubmitted: (String value) {
                di
                    .sl<GetRestaurantsCubit>()
                    .searchRestaurant(value);
              },
              controller: _searchController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
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
          ),
          BlocBuilder<GetRestaurantsCubit, GetRestaurantsState>(
            builder: (context, state) {
              if (state is GetSearchItemIsloading) {
                return const Center(
                  child: Text('Loading State '),
                );
              } else if (state is GetSearchItemLoaded) {
                return Text(state.restaurantDataEntity.error.toString());
              } else if (state is GetSearchItemError) {
                return Text(state.message.toString());
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )
        ],
      ),
    );
  }
}
