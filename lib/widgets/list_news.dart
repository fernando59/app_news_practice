import 'package:flutter/material.dart';
import 'package:news_app/theme/dark_mode.dart';

import '../models/news_models.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;

  const ListNews({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: news.length,
        itemBuilder: (BuildContext context, index) {
          return _New(article: news[index], index: index);
        });
  }
}

class _New extends StatelessWidget {
  const _New({super.key, required this.article, required this.index});
  final Article article;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TopBar(
          article: article,
          index: index,
        ),
        _CardTitle(
          article: article,
        ),
        _CardImage(
          article: article,
        ),
        _CardBody(article: article),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
        _CardButton(
          article: article,
        )
      ],
    );
  }
}

class _CardButton extends StatelessWidget {
  final Article article;
  const _CardButton({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        RawMaterialButton(
          onPressed: () {},
          fillColor: myThemeDark.colorScheme.secondary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.star_border),
        ),
        const SizedBox(width: 10),
        RawMaterialButton(
          onPressed: () {},
          fillColor: myThemeDark.colorScheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.more),
        ),
      ]),
    );
  }
}

class _CardBody extends StatelessWidget {
  final Article article;
  const _CardBody({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text((article.description != null) ? article.description! : ''),
    );
  }
}

class _CardImage extends StatelessWidget {
  final Article article;

  const _CardImage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: article.urlToImage != null
            ? FadeInImage(
                placeholder: const AssetImage('assets/img/giphy.gif'),
                image: NetworkImage(article.urlToImage!))
            : const Image(image: AssetImage('assets/img/no-image.png')),
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final Article article;

  const _CardTitle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        article.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final Article article;
  final int index;

  const _TopBar({super.key, required this.article, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}',
            style: TextStyle(color: myThemeDark.colorScheme.secondary),
          ),
          Text('${article.source.name}.')
        ],
      ),
    );
  }
}
