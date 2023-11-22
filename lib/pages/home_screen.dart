import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app_using_flutter/models/article_model.dart';
import 'package:news_app_using_flutter/models/catagory_model.dart';
import 'package:news_app_using_flutter/models/slider_model.dart';
import 'package:news_app_using_flutter/services/article_news.dart';
import 'package:news_app_using_flutter/services/category_data.dart';
import 'package:news_app_using_flutter/services/slider_data.dart';
import 'package:news_app_using_flutter/utilities/Widgets/buid_indicator.dart';
import 'package:news_app_using_flutter/utilities/Widgets/build_image.dart';
import 'package:news_app_using_flutter/utilities/Widgets/category_section.dart';
import 'package:news_app_using_flutter/utilities/comman%20Widgets/blog_tile.dart';
import 'package:news_app_using_flutter/utilities/comman%20Widgets/breaking_tranding_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  List<ArticleModel> articlesNewsList = [];
  bool _loading = true, loading2 = true;
  int _selectedIndex = 0;

  @override
  void initState() {
    categories = getCategories();
    getSlidersNews();
    getNews();
    super.initState();
  }

  getNews() async {
    ArticleNews newsVariable = ArticleNews();
    await newsVariable.getNews();
    articlesNewsList = newsVariable.actualNewsList;
    setState(() {
      _loading = false;
    });
  }

  getSlidersNews() async {
    SliderNews secVariable = SliderNews();
    await secVariable.getNews();
    sliders = secVariable.actualNewsListOfSliders;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  const SliverAppBar(
                    expandedHeight: 70,
                    backgroundColor: Colors.white,
                    centerTitle: true,
                    pinned: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Flutter',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          'News',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ];
              },
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      height: 70,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategorySection(
                            categoryImage: categories[index].catagoryImage,
                            categoryName: categories[index].catagoryName,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: BreakingAndTrandingRow(name: 'Breaking News!'),
                    ),
                    const SizedBox(height: 20),
                    CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (context, index, realIndex) {
                        String? image = sliders[index].urlToImage;
                        String? name = sliders[index].description;
                        return BuildImage(
                          image: image!,
                          name: name!,
                          index: index,
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        height: 200,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: BuildIndicator(
                          selectedIndex: _selectedIndex, pagesCounts: 5),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: BreakingAndTrandingRow(name: 'Tranding News!'),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: articlesNewsList.length,
                      itemBuilder: (context, index) {
                        return BlogTile(
                          title: articlesNewsList[index].title!,
                          description: articlesNewsList[index].description!,
                          imageUrl: articlesNewsList[index].urlToImage!,
                          url: articlesNewsList[index].url!,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
