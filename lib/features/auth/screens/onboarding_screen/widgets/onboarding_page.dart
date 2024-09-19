import 'package:flutter/material.dart';
import 'package:store/common/styles/text_styles.dart';
import 'package:store/utils/constants22/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

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
      padding: const EdgeInsets.all(CSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: CHelperFunctions.screenWidth() * 0.8,
            height: CHelperFunctions.screenHeight() * 0.6,
            image: AssetImage(
              image,
            ),
          ),
          Text(
            title,
            style: CTextStyles.titleTextStyle(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: CSizes.spaceBetweenItems,
          ),
          Text(
            subTitle,
            style: CTextStyles.subTitleTextStyle(context),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
