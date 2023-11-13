import 'package:flutter/material.dart';
import 'package:news_app_using_flutter/pages/home_screen.dart';
import 'package:news_app_using_flutter/pages/landing_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
    );
  }
}
