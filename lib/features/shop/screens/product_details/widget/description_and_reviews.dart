import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/core/common/widgets/texts/read_more_text.dart';
import 'package:store/core/common/widgets/texts/section_heading.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/features/shop/screens/rating_reviews/rating_review_screen.dart';
import 'package:store/core/utils/constants/sizes.dart';

class DescriptionAndReviews extends StatelessWidget {
  const DescriptionAndReviews({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // * Description

        const HeadingSection(
          title: 'Description',
          showActionButton: false,
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems,
        ),
        CustomReadMoreText(
          text: product.description ?? '',
        ),
        const Divider(),
        const SizedBox(
          height: AppSizes.spaceBetweenItems,
        ),
        // * Reviews
        ListTile(
          onTap: () =>  Get.toNamed(AppRoutes.productReview),
          contentPadding: EdgeInsets.zero,
          trailing: const Icon(Iconsax.arrow_right_3),
          title: Text(
            'Reviews(199)',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}
