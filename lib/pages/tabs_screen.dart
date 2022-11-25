import 'package:flutter/material.dart';
import 'package:news_app/models/navigation_model.dart';
import 'package:news_app/pages/tab1_screen.dart';
import 'package:news_app/pages/tab2_screen.dart';
import 'package:provider/provider.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationModel(),
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: (i) => navigationModel.currentPage = i,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'For You'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Header'),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<NavigationModel>(context);
    return PageView(
      controller: navigationModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Tab1Screen(),
        const Tab2Screen(),
      ],
    );
  }
}
