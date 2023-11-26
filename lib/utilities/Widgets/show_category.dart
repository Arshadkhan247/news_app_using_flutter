import 'package:flutter/material.dart';
import 'package:news_app_using_flutter/pages/category_news.dart';

// this class is use to display the visual representation of Each Categries.
// When we tap on a category this will help us to move news of selected category.

class ShowCategory extends StatelessWidget {
  final String categoryName;
  final String categoryImage;

  const ShowCategory(
      {Key? key, required this.categoryName, required this.categoryImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // this use to get Index and name of the category when user click each category.
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(name: categoryName)));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                categoryImage, // Assuming categoryImage is a local asset path
                height: 70,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 70,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  categoryName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
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
