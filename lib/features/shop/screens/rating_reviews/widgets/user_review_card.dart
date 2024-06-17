import 'package:flutter/material.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:store/common/widgets/texts/read_more_text.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(CImages.reviewer3),
            ),
            const SizedBox(
              width: CSizes.spaceBetweenItems,
            ),
            Text(
              'Muhammad Alaa',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_rounded),
            ),
          ],
        ),
        const SizedBox(
          height: CSizes.spaceBetweenItems / 2,
        ),
        // * review
        const Row(
          children: [
            CustomRatingBarIndicator(
              rating: 4.5,
              itemSize: 15,
            ),
            SizedBox(
              width: CSizes.spaceBetweenItems / 2,
            ),
            Text('01-Nov-2024'),
          ],
        ),
        const SizedBox(
          height: CSizes.spaceBetweenItems / 2,
        ),
        const CustomReadMoreText(
          text:
              'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly, Great Job! ',
        ),
        const SizedBox(
          height: CSizes.spaceBetweenItems,
        ),
        RoundedContainer(
          padding: const EdgeInsets.all(CSizes.md),
          backgroundColor: isDark ? CColors.darkGrey2 : Colors.grey[400],
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Alaa Store',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    '01 Nov 2024',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              const CustomReadMoreText(
                text:
                    'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly, Great Job! ',
              ),
            ],
          ),
        ),
        const SizedBox(
          height: CSizes.spaceBetweenSections,
        ),
      ],
    );
  }
}
