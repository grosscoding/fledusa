import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:fledusa/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2500,
      splash:
          'images/DALL·E 2022-12-07 17.59.12 - star sky planet in galaxy photorealistic.png',
      splashIconSize: 300,
      nextScreen: MyApp(),
      backgroundColor: Colors.black,
    );
  }
}
