import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app_using_flutter/models/article_model.dart';
import 'package:http/http.dart' as http;

 class ArticleNews {
 static List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/everything?q=tesla&from=2023-10-13&sortBy=publishedAt&apiKey=8ffb347859684bbdb8d6d67d570f8b44';

    var response = await http.get(
      Uri.parse(
        url,
      ),
    );
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((Element) {
        if (Element['urlToImage'] != null && Element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: Element['title'],
            description: Element['description'],
            urlToImage: Element['urlToImage'],
            url: Element['url'],
            content: Element['content'],
            author: Element['author']

          );
          news.add(articleModel);
        }
      });
    }
  }
}
