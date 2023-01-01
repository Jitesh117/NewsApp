import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../components/category_tile.dart';
import '../components/news_tile.dart';
import '../components/recommended_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.grey.shade200,
                Colors.grey.shade100,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16,
                top: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GradientText(
                    'Your Daily News',
                    colors: const [
                      Colors.deepPurple,
                      Colors.cyan,
                    ],
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CategoryTile(
                          categoryName: 'National',
                          imagePath: 'lib/assets/national.png',
                        ),
                        CategoryTile(
                          categoryName: 'Sports',
                          imagePath: 'lib/assets/sports.png',
                        ),
                        CategoryTile(
                          categoryName: 'Business',
                          imagePath: 'lib/assets/business.png',
                        ),
                        CategoryTile(
                          categoryName: 'World',
                          imagePath: 'lib/assets/world.png',
                        ),
                        CategoryTile(
                          categoryName: 'Politics',
                          imagePath: 'lib/assets/politics.png',
                        ),
                        CategoryTile(
                          categoryName: 'Technology',
                          imagePath: 'lib/assets/technology.png',
                        ),
                        CategoryTile(
                          categoryName: 'Startup',
                          imagePath: 'lib/assets/startup.png',
                        ),
                        CategoryTile(
                          categoryName: 'Science',
                          imagePath: 'lib/assets/science.png',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // News tiles
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Chosen category'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 7,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        NewsTile(),
                        NewsTile(),
                        NewsTile(),
                        NewsTile(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 3,
                    child: ListView(
                      children: [
                        RecommendedTile(),
                        RecommendedTile(),
                        RecommendedTile(),
                        RecommendedTile(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
