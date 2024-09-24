import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:store/core/utils/constants/sizes.dart';

import 'overall_product_rating.dart';

class OverallProductRatingSection extends StatelessWidget {
  const OverallProductRatingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //* overall product Ratings

        const OverallProductRating(),
        const CustomRatingBarIndicator(
          ratingValue: 4.5,
        ),
        Text(
          '11,333',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenSections,
        ),
      ],
    );
  }
}
