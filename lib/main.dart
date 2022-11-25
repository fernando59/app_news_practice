import 'package:flutter/material.dart';
import 'package:news_app/pages/tabs_screen.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/theme/dark_mode.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NewsService())],
      child: MaterialApp(
        title: 'Material App',
        theme: myThemeDark,
        debugShowCheckedModeBanner: false,
        home: const TabScreen(),
      ),
    );
  }
}
