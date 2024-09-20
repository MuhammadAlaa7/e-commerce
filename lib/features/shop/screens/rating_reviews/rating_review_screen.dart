import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/core/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:store/features/shop/screens/rating_reviews/widgets/user_review_card.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'widgets/overall_product_rating.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text('Reviews & Ratings '),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Ratings and reviews are verified and are from people who use the same type of device that you use '),
              SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),
              // * overall product rating section
              OverallProductRatingSection(),

              //  * user reviews list

              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

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
          rating: 4.5,
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
