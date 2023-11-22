// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_using_flutter/models/slider_model.dart';

class SliderNews {
  List<SliderModel> actualNewsListOfSliders = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=8ffb347859684bbdb8d6d67d570f8b44';

    var response = await http.get(
      Uri.parse(
        url,
      ),
    );
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      jsonData['articles'].forEach((Element) {
        if (Element['urlToImage'] != null && Element['description'] != null) {
          SliderModel sliderModel = SliderModel(
              title: Element['title'],
              description: Element['description'],
              urlToImage: Element['urlToImage'],
              url: Element['url'],
              content: Element['content'],
              author: Element['author']);

          actualNewsListOfSliders.add(sliderModel);
          actualNewsListOfSliders.shuffle(); // this property is used to shuffle the index of the newly adding values.
        }
      });
    }
  }
}
