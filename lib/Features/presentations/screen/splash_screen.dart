import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:returants_app/Features/presentations/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    late Timer _timer;
  goNext() => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false);
  startDely() {
    _timer = Timer(const Duration(seconds: 7), () {
      goNext();
    });
  }

  @override
  void initState() {
    super.initState();
    startDely();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            //Lottie.network('https://lottie.host/embed/6a300246-bd03-43a4-b710-30235a4f589b/qkaPM8JCFK.json'),
          Lottie.asset('assets/animation/Animation - 1703755664242.json'),
          ],
        ),
      ),
    );
  }
}