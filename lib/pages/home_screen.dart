import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app_using_flutter/models/catagory_model.dart';
import 'package:news_app_using_flutter/models/slider_model.dart';
import 'package:news_app_using_flutter/services/catagory_data.dart';
import 'package:news_app_using_flutter/services/slider_data.dart';
import 'package:news_app_using_flutter/utilities/Widgets/buid_indicator.dart';
import 'package:news_app_using_flutter/utilities/Widgets/build_image.dart';
import 'package:news_app_using_flutter/utilities/Widgets/category_section.dart';
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

  int _selectedIndex = 0;

  @override
  void initState() {
    categries = getCatagories();
    sliders = getSliders();
    super.initState();
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
      body: SingleChildScrollView(
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
                return BuildImage(image: image!, name: name!, index: index);
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/sport.jpg',
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.8,
                            child: const Text(
                              'Write something about the sport that we can get the idea about the specific game.',
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.8,
                            child: const Text(
                              'Write something about the sport that we can get the idea about the specific game.',
                              maxLines: 3,
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/sport.jpg',
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.8,
                            child: const Text(
                              'Write something about the sport that we can get the idea about the specific game.',
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.8,
                            child: const Text(
                              'Write something about the sport that we can get the idea about the specific game.',
                              maxLines: 3,
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/sport.jpg',
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.8,
                            child: const Text(
                              'Write something about the sport that we can get the idea about the specific game.',
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.8,
                            child: const Text(
                              'Write something about the sport that we can get the idea about the specific game.',
                              maxLines: 3,
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
