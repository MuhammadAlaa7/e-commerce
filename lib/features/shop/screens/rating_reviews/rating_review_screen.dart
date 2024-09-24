import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/features/shop/screens/rating_reviews/widgets/user_review_card.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'widgets/product_rating_section.dart';

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

              UserReviewCard(
                userName: 'Muhammad Alaa',
                userImage: AppImages.userProfileImage2,
                date: '01 Nov 2024',
              ),
              UserReviewCard(
                userName: 'Khaled Ahmed',
                userImage: AppImages.userProfileImage3,
                date: '17 Oct 2024',
              ),
              UserReviewCard(
                userName: 'Mariam Ali',
                userImage: AppImages.userProfileImage1,
                date: '07 Aug 2024',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
