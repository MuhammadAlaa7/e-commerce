import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/utils/constants22/colors.dart';

class CustomRatingBarIndicator extends StatelessWidget {
  const CustomRatingBarIndicator({
    super.key,
    required this.rating,
    this.itemSize = 20,
  });

  final double rating;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemCount: 5,
      itemSize: itemSize,
      rating: rating,
      unratedColor: Colors.grey,
      itemBuilder: (_, __) {
        return const Icon(
          Iconsax.star1,
          color: CColors.primary,
        );
      },
    );
  }
}
