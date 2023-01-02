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
  String chosenCategory = 'National news';
  List<Map<String, String>> dataList = List.generate(5, (index) => {});
  void fetchData(String category) async {
    setState(() {
      _isLoading = true;
      chosenCategory = category + ' news';
      chosenCategory = chosenCategory.toUpperCase();
    });
    http.Response response;
    response = await http
        .get(Uri.parse('https://inshorts.deta.dev/news?category=${category}'));
    NewsData newsData = NewsData.fromJson(json.decode(response.body));
    for (int i = 0; i < 5; i++) {
      dataList[i].addAll({
        'imagePath': newsData.data![i].imageUrl!,
        'newsTitle': newsData.data![i].title!,
        'date': newsData.data![i].date!
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    fetchData('national');
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
                  style: const TextStyle(
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
                      GestureDetector(
                        onTap: () {
                          fetchData('national');
                        },
                        child: CategoryTile(
                          categoryName: 'National',
                          imagePath: 'lib/assets/national.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          fetchData('sports');
                        },
                        child: CategoryTile(
                          categoryName: 'Sports',
                          imagePath: 'lib/assets/sports.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          fetchData('business');
                        },
                        child: CategoryTile(
                          categoryName: 'Business',
                          imagePath: 'lib/assets/business.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          fetchData('world');
                        },
                        child: CategoryTile(
                          categoryName: 'World',
                          imagePath: 'lib/assets/world.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          fetchData('politics');
                        },
                        child: CategoryTile(
                          categoryName: 'Politics',
                          imagePath: 'lib/assets/politics.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          fetchData('technology');
                        },
                        child: CategoryTile(
                          categoryName: 'Technology',
                          imagePath: 'lib/assets/technology.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          fetchData('startup');
                        },
                        child: CategoryTile(
                          categoryName: 'startup',
                          imagePath: 'lib/assets/startup.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          fetchData('science');
                        },
                        child: CategoryTile(
                          categoryName: 'Science',
                          imagePath: 'lib/assets/science.png',
                        ),
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
                  child: Text(
                    chosenCategory,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 7,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return _isLoading
                          ? ShimmerNewsTile()
                          : LoadedNews(
                              imagePath: dataList[index]["imagePath"]!,
                              newsTitle: dataList[index]["newsTitle"]!,
                              newsDate: dataList[index]["date"]!,
                            );
                    },
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
      ),
    );
  }
}
