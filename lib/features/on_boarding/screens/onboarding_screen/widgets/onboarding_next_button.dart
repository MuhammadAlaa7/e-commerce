import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/on_boarding/controllers/onboarding/on_boarding_controller.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
     final controller = OnBoardingController.instance; 
    
    return Positioned(
      bottom: kBottomNavigationBarHeight,
      right: AppSizes.defaultSpace,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: dark ? AppColors.primary : Colors.deepPurple),
          //    shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
          backgroundColor: dark ? AppColors.primary : Colors.deepPurple,
        ),

        child: Obx(
          () => Text(
             controller.currentPageIndex.value == 2
                ? 'Get Started'
                : 'Next',
          ),
        ),

      
        onPressed: () {
         controller.nextPage();
        },
      ),
    );
  }
}
