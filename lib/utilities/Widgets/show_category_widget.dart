import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShowCategoryWidget extends StatelessWidget {
  const ShowCategoryWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.image,
      required this.url});
  final  String title, description, image,url;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: image,
          width: MediaQuery.of(context).size.width,
          height: 200,
          fit: BoxFit.cover,
        ),
        Text(title,
          maxLines: 2,
          style: const TextStyle(
              color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Text(description,
          maxLines: 3,
        ),
         const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
