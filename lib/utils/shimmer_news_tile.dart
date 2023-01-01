import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerNewsTile extends StatelessWidget {
  const ShimmerNewsTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 26,
            horizontal: 8,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer(
                  duration: Duration(seconds: 2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 200,
                    width: 250,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Shimmer(
                  duration: Duration(seconds: 2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 30,
                    width: 250,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Shimmer(
                  duration: Duration(seconds: 2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 30,
                    width: 200,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Shimmer(
                  duration: Duration(seconds: 2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 30,
                    width: 150,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
