import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:returants_app/Features/presentations/cubit/get_restaurants_cubit.dart';
import 'package:returants_app/Features/presentations/screen/home_screen.dart';
import 'package:returants_app/Features/presentations/screen/splash_screen.dart';
import 'package:returants_app/injection_container.dart'as di;

class MyApp extends StatefulWidget {
  const MyApp._internal();
static  const _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>di.sl<GetRestaurantsCubit>())
    ], child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
     scaffoldBackgroundColor: Colors.grey[50],
     primaryColor: Colors.deepOrangeAccent
      ),
      home:const  SplashScreen(),
    ) );
  }
}
