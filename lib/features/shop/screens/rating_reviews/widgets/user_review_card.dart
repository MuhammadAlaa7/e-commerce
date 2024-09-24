import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:store/core/common/widgets/texts/read_more_text.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/constants/sizes.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({
    super.key,
    required this.userName,
    required this.userImage,
    required this.date,
  });

  final String userName;
  final String userImage;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
             CircleAvatar(
              backgroundImage: AssetImage(userImage),
            ),
            const SizedBox(
              width: AppSizes.spaceBetweenItems,
            ),
            Text(
              userName,
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
          height: AppSizes.spaceBetweenItems / 2,
        ),
        // * review
         Row(
          children: [
            const CustomRatingBarIndicator(
              ratingValue: 4.5,
              itemSize: 15,
            ),
            const SizedBox(
              width: AppSizes.spaceBetweenItems / 2,
            ),
            Text(date),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems / 2,
        ),
        const CustomReadMoreText(
          text:
              'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly, Great Job! ',
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems,
        ),

        const SizedBox(
          height: AppSizes.spaceBetweenSections,
        ),
      ],
    );
  }
}



// admin reply to the reviews 



/* 

  RoundedContainer(
          padding: const EdgeInsets.all(AppSizes.md),
          backgroundColor: isDark ? AppColors.darkerGrey : Colors.grey[400],
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
                height: AppSizes.spaceBetweenItems,
              ),
              const CustomReadMoreText(
                text:
                    'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly, Great Job! ',
              ),
            ],
          ),
        ),

 */