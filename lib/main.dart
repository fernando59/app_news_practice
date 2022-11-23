import 'package:flutter/material.dart';
import 'package:news_app/pages/tabs_screen.dart';
import 'package:news_app/theme/dark_mode.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: myThemeDark,
      debugShowCheckedModeBanner: false,
      home: const TabScreen(),
    );
  }
}
