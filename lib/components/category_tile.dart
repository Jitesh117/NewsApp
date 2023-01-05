import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.categoryName,
    required this.imagePath,
    required this.isSelected,
  }) : super(key: key);
  final String categoryName;
  final String imagePath;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        width: 150,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: isSelected
                ? [
                    Colors.red,
                    Colors.orange,
                  ]
                : [
                    Colors.blue.shade900,
                    Colors.cyan,
                  ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 40,
              width: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              categoryName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
