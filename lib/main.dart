import 'package:fitnessapp/pages/home.dart';
import 'package:fitnessapp/pages/splashpage.dart';
import 'package:fitnessapp/pages/signin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SplashPage());
  }
}
