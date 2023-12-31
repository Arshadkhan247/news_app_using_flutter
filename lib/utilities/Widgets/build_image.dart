import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_using_flutter/pages/article_webview.dart';

class BuildImage extends StatelessWidget {
  const BuildImage(
      {super.key,
      required this.image,
      required this.name,
      required this.index,
      required this.blogUrl});
  final String image;
  final String name;
  final int index;
  final String blogUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleWebView(
              blogUrl: blogUrl,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: image,
                height: 250,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              height: 250,
              padding: const EdgeInsets.only(left: 10),
              margin: const EdgeInsets.only(top: 130),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                name,
                maxLines: 2,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
