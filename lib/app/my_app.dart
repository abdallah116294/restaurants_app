import 'package:flutter/material.dart';
import 'package:returants_app/screen/home_screen.dart';

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
    return  MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
     scaffoldBackgroundColor: Colors.grey[50],
     primaryColor: Colors.deepOrangeAccent
      ),
      home:const  HomeScreen(),
    );
  }
}
