import 'package:flutter/material.dart';
import 'package:news_app_using_flutter/models/article_model.dart';
import 'package:news_app_using_flutter/utilities/comman%20Widgets/blog_tile.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key, required this.articlesNewsList});
  final List<ArticleModel> articlesNewsList;

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'All',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'News',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.articlesNewsList.length,
              itemBuilder: (context, index) {
                return BlogTile(
                  title: widget.articlesNewsList[index].title!,
                  description: widget.articlesNewsList[index].description!,
                  imageUrl: widget.articlesNewsList[index].urlToImage!,
                  url: widget.articlesNewsList[index].url!,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
