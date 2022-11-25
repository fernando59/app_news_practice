import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatefulWidget {
  Tab1Screen({Key? key}) : super(key: key);

  @override
  State<Tab1Screen> createState() => _tab1ScreenState();
}

class _tab1ScreenState extends State<Tab1Screen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;
    return Scaffold(
        body: headlines.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListNews(news: headlines));
  }

  @override
  bool get wantKeepAlive => true;
}
