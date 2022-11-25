import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/news_models.dart';
import 'package:http/http.dart' as http;

const _apiKey = '9ccdf664076642bb98de4d846c04afe9';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sport'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];
  Map<String, List<Article>> categoriesArticle = {};

  NewsService() {
    getTopHeadlines();
    categories.forEach((element) {
      categoriesArticle[element.name] = [];
    });
    selectedCategory = _selectedCategory;
  }

  String get selectedCategory => _selectedCategory;
  set selectedCategory(String value) {
    _selectedCategory = value;
    getArticlesByCategory(value);
    notifyListeners();
  }

  List<Article> get getArticleCategorySelected =>
      categoriesArticle[selectedCategory]!;

  getTopHeadlines() async {
    final url = Uri.https('newsapi.org', '/v2/top-headlines',
        {'country': 'us', 'apiKey': _apiKey});
    final res = await http.get(url);
    final data = NewsResponse.fromJson(res.body);
    headlines.addAll(data.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoriesArticle[category] != null) {
      if (categoriesArticle[category]!.isNotEmpty) {
        return categoriesArticle[category];
      }
    }

    final url = Uri.https('newsapi.org', '/v2/top-headlines',
        {'country': 'us', 'apiKey': _apiKey, 'category': category});
    final res = await http.get(url);
    final data = NewsResponse.fromJson(res.body);
    categoriesArticle[category]?.addAll(data.articles);
    notifyListeners();
  }
}
