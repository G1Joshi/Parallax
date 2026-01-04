import 'package:flutter/material.dart';

import 'constants/app_constants.dart';
import 'screens/parallax_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: .dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: const ParallaxHome(),
    );
  }
}
