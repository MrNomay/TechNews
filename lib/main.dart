import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_news/Backend/provider.dart';
import 'package:tech_news/pages/homepage.dart';
import 'package:tech_news/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Notifier>(create: (context) => Notifier())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark, primaryColor: Appcolors.primary),
        home: const Home(),
      ),
    );
  }
}
