import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store/features/on_boarding/controllers/onboarding/on_boarding_controller.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
              final controller = OnBoardingController.instance ;
    return Positioned(
      bottom: kBottomNavigationBarHeight + 25,
      left: AppSizes.defaultSpace,
      child: SmoothPageIndicator(
        // onDotClicked: controller.dotNavigationClick,
        //* just give it the controller of the page view from the controller
        //* which in the same time is giving to the page view in the scaffold

        controller: controller.pageController,

        // * the number of dots
        count: 3,
// * the effect here is to expand the dots which is selected
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? AppColors.primary : Colors.deepPurple,
          dotHeight: 6,
        ),
      ),
    );
  }
}
