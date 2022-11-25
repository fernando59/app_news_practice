import 'package:flutter/cupertino.dart';

class NavigationModel with ChangeNotifier {
  int _currentPage = 0;

  PageController _pageController = new PageController();

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    _pageController.animateToPage(value,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
