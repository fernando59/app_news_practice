import 'package:flutter/cupertino.dart';
import 'package:news_app/models/news_models.dart';
import 'package:http/http.dart' as http;

const _apiKey = '9ccdf664076642bb98de4d846c04afe9';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = Uri.https('newsapi.org', '/v2/top-headlines',
        {'country': 'it', 'apiKey': _apiKey});
    final res = await http.get(url);
    final data = NewsResponse.fromJson(res.body);
    headlines.addAll(data.articles);
    notifyListeners();
  }
}
