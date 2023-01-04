import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news/components/news_tile.dart';
import 'package:news/utils/news_data.dart';
import 'package:news/utils/shimmer_news_tile.dart';
import 'package:news/utils/shimmer_recommended.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../components/category_tile.dart';
import '../components/recommended_tile.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

// TODO: add url opener of the news tiles when the user taps on read more
// TODO: add a tiktok style scroller for news when the user taps
class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  bool _isRecommendedLoading = true;
  String chosenCategory = 'National news';
  int itemCount = 5;
  int recommendedItemCount = 5;
  List<Map<String, String>> dataList = List.generate(100, (index) => {});
  List<Map<String, String>> recommendedList = List.generate(100, (index) => {});
  List<bool> isSelected = List.generate(11, (index) => false);

  void fetchRecommended() async {
    setState(() {
      _isRecommendedLoading = true;
      recommendedItemCount = 5;
    });
    http.Response response;
    response = await http
        .get(Uri.parse('https://inshorts.deta.dev/news?category=all'));
    NewsData newsData = NewsData.fromJson(json.decode(response.body));
    for (int i = 0; i < newsData.data!.length; i++) {
      recommendedList[i].addAll({
        'imagePath': newsData.data![i].imageUrl!,
        'newsTitle': newsData.data![i].title!,
        'date': newsData.data![i].date!
      });
    }
    setState(() {
      _isRecommendedLoading = false;
      recommendedItemCount = newsData.data!.length;
    });
  }

  void fetchData(String category) async {
    setState(() {
      _isLoading = true;
      chosenCategory = '$category news';
      chosenCategory = chosenCategory.toUpperCase();
      itemCount = 5;
    });
    http.Response response;
    response = await http
        .get(Uri.parse('https://inshorts.deta.dev/news?category=${category}'));
    NewsData newsData = NewsData.fromJson(json.decode(response.body));
    for (int i = 0; i < newsData.data!.length; i++) {
      dataList[i].addAll({
        'imagePath': newsData.data![i].imageUrl!,
        'newsTitle': newsData.data![i].title!,
        'date': newsData.data![i].date!
      });
    }
    setState(() {
      _isLoading = false;
      itemCount = newsData.data!.length;
    });
  }

  void selectCategory(int i) {
    setState(
      () {
        for (int category = 0; category < 10; category++) {
          isSelected[category] = false;
        }
        isSelected[i] = true;
      },
    );
  }

  @override
  void initState() {
    fetchData('national');
    fetchRecommended();
    selectCategory(0);
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
                          selectCategory(0);
                        },
                        child: CategoryTile(
                          categoryName: 'National',
                          imagePath: 'lib/assets/national.png',
                          isSelected: isSelected[0],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          fetchData('sports');
                          selectCategory(1);
                        },
                        child: CategoryTile(
                          categoryName: 'Sports',
                          imagePath: 'lib/assets/sports.png',
                          isSelected: isSelected[1],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          fetchData('business');
                          selectCategory(2);
                        },
                        child: CategoryTile(
                          categoryName: 'Business',
                          imagePath: 'lib/assets/business.png',
                          isSelected: isSelected[2],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          fetchData('world');
                          selectCategory(3);
                        },
                        child: CategoryTile(
                          categoryName: 'World',
                          imagePath: 'lib/assets/world.png',
                          isSelected: isSelected[3],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          fetchData('politics');
                          selectCategory(4);
                        },
                        child: CategoryTile(
                          categoryName: 'Politics',
                          imagePath: 'lib/assets/politics.png',
                          isSelected: isSelected[4],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          fetchData('technology');
                          selectCategory(5);
                        },
                        child: CategoryTile(
                          categoryName: 'Technology',
                          imagePath: 'lib/assets/technology.png',
                          isSelected: isSelected[5],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          fetchData('startup');
                          selectCategory(6);
                        },
                        child: CategoryTile(
                          categoryName: 'startup',
                          imagePath: 'lib/assets/startup.png',
                          isSelected: isSelected[6],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          fetchData('science');
                          selectCategory(7);
                        },
                        child: CategoryTile(
                          categoryName: 'Science',
                          imagePath: 'lib/assets/science.png',
                          isSelected: isSelected[7],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // News tiles
                // Padding(
                //   padding: const EdgeInsets.only(left: 8.0),
                //   child: Text(
                //     chosenCategory,
                //     style: const TextStyle(
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 7,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return _isLoading
                          ? const ShimmerNewsTile()
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
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Recommended News',
                    // style: TextStyle(
                    //   fontWeight: FontWeight.normal,
                    // ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                    itemCount: recommendedItemCount,
                    itemBuilder: (context, index) {
                      return _isRecommendedLoading
                          ? ShimmerRecommended()
                          : RecommendedTile(
                              imagePath: recommendedList[index]["imagePath"]!,
                              newsTitle: recommendedList[index]["newsTitle"]!);
                    },
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
