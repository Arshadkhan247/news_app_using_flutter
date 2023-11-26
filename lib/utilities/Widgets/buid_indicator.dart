import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// here i created a widget for showing the list elements.
// using smooth Page indicator.

class BuildIndicator extends StatelessWidget {
  const BuildIndicator(
      {super.key, required this.selectedIndex, required this.pagesCounts});

  final int selectedIndex;
  final int pagesCounts;

  // Passing two parameters. To get the selected index and get the lenght of sliders list.

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
        effect: const ScrollingDotsEffect(
          activeDotColor: Colors.blue,
          dotHeight:
              10, // height and weight should be same if we want a round dot.
          dotWidth: 10,
        ),
        activeIndex: selectedIndex,
        count: pagesCounts);
  }
}
