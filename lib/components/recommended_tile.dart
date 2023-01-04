import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RecommendedTile extends StatelessWidget {
  const RecommendedTile({
    Key? key,
    required this.imagePath,
    required this.newsTitle,
    required this.readMoreUrl,
  }) : super(key: key);
  final String imagePath;
  final String newsTitle;
  final String readMoreUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String url = readMoreUrl;
        if (await canLaunch(
          url,
        )) {
          await launch(
            url,
            forceWebView: true,
          );
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image(
                      image: NetworkImage(
                        imagePath,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    newsTitle,
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
