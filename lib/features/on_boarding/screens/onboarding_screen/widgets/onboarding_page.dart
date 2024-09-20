import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: AppHelperFunctions.screenWidth() * 0.8,
            height: AppHelperFunctions.screenHeight() * 0.6,
            image: AssetImage(
              image,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: AppSizes.spaceBetweenItems,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
