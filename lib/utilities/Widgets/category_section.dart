// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  final categoryName;
  final categoryImage;
  const CategorySection({super.key, this.categoryName, this.categoryImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              categoryImage,
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
              borderRadius: BorderRadius.circular(
                6,
              ),
            ),
            child: Center(
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
