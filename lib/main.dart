import 'package:flutter/material.dart';
import 'package:tech_news/pages/homepage.dart';
import 'package:tech_news/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
brightness: Brightness.dark, primaryColor: Appcolors.primary
      ),
      home: const Home(),
    );
  }
}

