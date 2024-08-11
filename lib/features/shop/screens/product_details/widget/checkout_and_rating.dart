import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/buttons/default_button.dart';
import 'package:store/common/widgets/texts/read_more_text.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/screens/rating_reviews/rating_review_screen.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class CheckoutAndReviews extends StatelessWidget {
  const CheckoutAndReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultButton(
          label: 'Checkout',
          onPressed: () {},
        ),
        const SizedBox(
          height: CSizes.spaceBetweenSections,
        ),

        // * Description

        const HeadingSection(
          title: 'Description',
          showActionButton: false,
        ),
        const SizedBox(
          height: CSizes.spaceBetweenItems,
        ),
        const CustomReadMoreText(
          text:
              'this is the description of the product it can be up to 4 lines this is the description of the product it can be up to 4 lines',
        ),
        const Divider(),
        const SizedBox(
          height: CSizes.spaceBetweenItems,
        ),
        // * Reviews
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadingSection(
              title: 'Reviews(199)',
              showActionButton: false,
              onPressed: () {},
            ),
            IconButton(
                onPressed: () {
                  CHelperFunctions.goTo(context, const ProductReviewScreen());
                },
                icon: const Icon(Iconsax.arrow_right_3)),
          ],
        ),
      ],
    );
  }
}
