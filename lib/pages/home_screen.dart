import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app_using_flutter/models/article_model.dart';
import 'package:news_app_using_flutter/models/catagory_model.dart';
import 'package:news_app_using_flutter/models/slider_model.dart';
import 'package:news_app_using_flutter/services/article_news.dart';
import 'package:news_app_using_flutter/services/catagory_data.dart';
import 'package:news_app_using_flutter/services/slider_data.dart';
import 'package:news_app_using_flutter/utilities/Widgets/buid_indicator.dart';
import 'package:news_app_using_flutter/utilities/Widgets/build_image.dart';
import 'package:news_app_using_flutter/utilities/Widgets/category_section.dart';
import 'package:news_app_using_flutter/utilities/comman%20Widgets/blog_tile.dart';
import 'package:news_app_using_flutter/utilities/comman%20Widgets/breaking_tranding_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categries = [];
  // this list store data of Differents categories.
  List<SliderModel> sliders = [];
  // this list store data of breaking news sliders.

  List<ArticleModel> articlesNewsList = [];

  // taking two bool variables to help in loading of the page initially.
  bool _loading = true, loading2 = true;

  int _selectedIndex =
      0; // this index work for turning indicator down the carousel.

  @override
  void initState() {
    categries = getCatagories();
    sliders = getSliders();
    getnews();
    super.initState();
  }

  // creating a function for getting all the news

  getnews() async {
    ArticleNews newsVariable = ArticleNews();
    await newsVariable.getNews();
    articlesNewsList = newsVariable.actualNewsList;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Flutter',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'News',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ],
          )),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 70,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categries.length,
                      itemBuilder: (context, index) {
                        return CategorySection(
                          categoryImage: categries[index].catagoryImage,
                          categoryName: categries[index].catagoryName,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),

                      // BreakingAndTrandingRow  Widget is separately designed.
                      child: BreakingAndTrandingRow(name: 'Breaking News!')),
                  const SizedBox(
                    height: 20,
                  ),

                  // this property enable to flip the card within specific time automatically.
                  // And this required two thing 1. need image url.  2. News description.
                  CarouselSlider.builder(
                    itemCount: sliders.length,
                    itemBuilder: (context, index, realIndex) {
                      String? image = sliders[index].sliderImage;
                      String? name = sliders[index].sliderName;
                      // BuildImage Widget is separately designed.
                      return BuildImage(
                          image: image!, name: name!, index: index);
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
                  const SizedBox(
                    height: 30,
                  ),

                  // BuildIndicator is a separate Widget. Help us to design scrolling Dot function with turing sliders.
                  Center(
                    child: BuildIndicator(
                      selectedIndex: _selectedIndex,
                      pagesCounts: sliders.length,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: BreakingAndTrandingRow(name: 'Tranding News!'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .5,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: articlesNewsList.length,
                        itemBuilder: (context, index) {
                          return BlogTile(
                            title: articlesNewsList[index].title!,
                            description: articlesNewsList[index].description!,
                            imageUrl: articlesNewsList[index].urlToImage!,
                            url: articlesNewsList[index].url!,
                          );
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
