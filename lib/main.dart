import 'package:flutter/material.dart';
import 'package:nba_api_app/pages/home_page.dart';
import 'package:nba_api_app/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: lightmode,
      darkTheme: darkmode,
    );
  }
}