import 'package:flutter/material.dart';
import 'package:news_app_using_flutter/models/show_category_model.dart';
import 'package:news_app_using_flutter/services/show_catagory_data.dart';
import 'package:news_app_using_flutter/utilities/Widgets/show_category_widget.dart';

class CategoryNews extends StatefulWidget {
  const CategoryNews({
    super.key,
    required this.name,
  });
  final String name;

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoryNews(widget.name.toLowerCase());
    categories = showCategoryNews.catagories;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style:
              const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return ShowCategoryWidget(
                  image: categories[index].urlToImage!,
                  description: categories[index].description!,
                  title: categories[index].title!,
                  url: categories[index].url!);
            }),
      ),
    );
  }
}
