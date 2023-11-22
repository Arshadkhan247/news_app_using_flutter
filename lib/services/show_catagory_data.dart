// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_using_flutter/models/show_category_model.dart';

class ShowCategoryNews {
  List<ShowCategoryModel> catagories = [];

  Future<void> getCategoryNews(String category) async {
    String categoryUrl =
        'https://newsapi.org/v2/top-headlines?country=us&$category=business&apiKey=8ffb347859684bbdb8d6d67d570f8b44';

    var response = await http.get(
      Uri.parse(
        categoryUrl,
      ),
    );
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      jsonData['articles'].forEach(
        (Element) {
          if (Element['urlToImage'] != null && Element['description'] != null) {
            ShowCategoryModel showCategoryModel = ShowCategoryModel(
              title: Element['title'],
              description: Element['description'],
              urlToImage: Element['urlToImage'],
              url: Element['url'],
              content: Element['content'],
              author: Element['author'],
            );
            catagories.add(showCategoryModel);
          }
        },
      );
    }
  }
}
