import 'package:flutter/material.dart';
import 'package:news_app_using_flutter/models/article_model.dart';
import 'package:news_app_using_flutter/pages/all_news.dart';
import 'package:news_app_using_flutter/services/article_news.dart';
import 'package:news_app_using_flutter/utilities/Style/text_style.dart';

// ignore: must_be_immutable
class BreakingAndTrandingRow extends StatefulWidget {
  BreakingAndTrandingRow({super.key, required this.name});

  String name;

  @override
  State<BreakingAndTrandingRow> createState() => _BreakingAndTrandingRowState();
}

class _BreakingAndTrandingRowState extends State<BreakingAndTrandingRow> {
  List<ArticleModel> articlesNewsList = [];

  @override
  void initState() {
    getnews();
    super.initState();
  }

  getnews() async {
    ArticleNews newsVariable = ArticleNews();
    await newsVariable.getNews();
    articlesNewsList = newsVariable.actualNewsList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.name, style: textStyle),
        GestureDetector(
          onTap: () {},
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllNews(articlesNewsList: articlesNewsList),
                  ));
            },
            child: const Text(
              "View All",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
