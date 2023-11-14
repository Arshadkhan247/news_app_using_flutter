import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BlogTile extends StatelessWidget {
  const BlogTile({
    super.key,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
  });

  final String description, imageUrl, url, title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: Text(
                        title,
                        maxLines: 2,
                        style: const TextStyle(
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
                      child: Text(
                        description,
                        maxLines: 3,
                        style: const TextStyle(
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
    );
  }
}
