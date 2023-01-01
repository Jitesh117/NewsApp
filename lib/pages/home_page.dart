import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news/utils/loaded_news_tile.dart';
import 'package:news/utils/news_data.dart';
import 'package:news/utils/shimmer_news_tile.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../components/category_tile.dart';
import '../components/news_tile.dart';
import '../components/recommended_tile.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  String imagePath = '';
  String newsTitle = '';
  void fetchData() async {
    http.Response response;
    response = await http
        .get(Uri.parse('https://inshorts.deta.dev/news?category=science'));
    NewsData newsData = NewsData.fromJson(json.decode(response.body));
    imagePath = newsData.data![0].imageUrl!;
    newsTitle = newsData.data![0].title!;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

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
                        _isLoading
                            ? ShimmerNewsTile()
                            : LoadedNews(
                                imagePath: imagePath,
                                newsTitle: newsTitle,
                              ),
                        _isLoading
                            ? ShimmerNewsTile()
                            : LoadedNews(
                                imagePath: imagePath,
                                newsTitle: newsTitle,
                              ),
                        _isLoading
                            ? ShimmerNewsTile()
                            : LoadedNews(
                                imagePath: imagePath,
                                newsTitle: newsTitle,
                              ),
                        _isLoading
                            ? ShimmerNewsTile()
                            : LoadedNews(
                                imagePath: imagePath,
                                newsTitle: newsTitle,
                              ),
                        _isLoading
                            ? ShimmerNewsTile()
                            : LoadedNews(
                                imagePath: imagePath,
                                newsTitle: newsTitle,
                              ),
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
