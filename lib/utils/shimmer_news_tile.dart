import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerNewsTile extends StatefulWidget {
  const ShimmerNewsTile({
    Key? key,
  }) : super(key: key);

  @override
  State<ShimmerNewsTile> createState() => _ShimmerNewsTileState();
}

class _ShimmerNewsTileState extends State<ShimmerNewsTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade800,
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
                  duration: Duration(seconds: 1),
                  color: Colors.cyan.shade400,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
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
                  duration: Duration(seconds: 1),
                  color: Colors.cyan.shade400,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
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
                  color: Colors.cyan.shade400,
                  duration: Duration(seconds: 1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
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
                  color: Colors.cyan.shade400,
                  duration: Duration(seconds: 1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
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
