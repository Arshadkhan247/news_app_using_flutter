import 'package:flutter/material.dart';
import 'package:news_app_using_flutter/utilities/Style/text_style.dart';

// ignore: must_be_immutable
class BreakingAndTrandingRow extends StatelessWidget {
  BreakingAndTrandingRow({super.key, required this.name});

  String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: textStyle),
        GestureDetector(
          onTap: () {},
          child: const Text(
            "View All",
            style: TextStyle(
                color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
