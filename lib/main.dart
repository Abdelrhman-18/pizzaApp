import 'package:flutter/material.dart';
import 'package:untitled12/Loginpage.dart';
import 'package:untitled12/SplashScreen.dart';
import 'package:untitled12/screenone.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),

    );
  }
}
