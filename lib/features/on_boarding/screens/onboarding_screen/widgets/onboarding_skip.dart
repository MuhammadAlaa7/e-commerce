import 'package:flutter/material.dart';
import 'package:store/features/on_boarding/controllers/onboarding/on_boarding_controller.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Positioned(
      top: kToolbarHeight,
      right: AppSizes.defaultSpace,
      child: TextButton(
        child: Text(
          'Skip',
          style: TextStyle(color: dark ? AppColors.primary : Colors.deepPurple),
        ),
        onPressed: () {
         OnBoardingController.instance.skipPage();
         
        },
      ),
    );
  }
}
