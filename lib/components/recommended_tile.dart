import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../utils/shimmer_recommended.dart';

class RecommendedTile extends StatelessWidget {
  const RecommendedTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerRecommended();
  }
}
