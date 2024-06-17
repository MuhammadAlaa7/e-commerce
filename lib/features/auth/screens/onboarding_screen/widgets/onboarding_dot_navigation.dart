import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store/features/auth/controllers/onboarding/onboarding_cubit.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    final cubit = BlocProvider.of<OnBoardingCubit>(context);
    return Positioned(
      bottom: kBottomNavigationBarHeight + 25,
      left: CSizes.defaultSpace,
      child: SmoothPageIndicator(
        onDotClicked: cubit.dotNavigationClick,
        //* just give it the controller of the page view from the cubit
        //* which in the same time is giving to the page view in the scaffold
      
        controller: cubit.pageController,

      // * the number of dots 
        count: 3,
// * the effect here is to expand the dots which is selected
        effect: ExpandingDotsEffect(
          
          activeDotColor: dark ? CColors.primary : Colors.deepPurple,

          dotHeight: 6,
        ),
      ),
    );
  }
}
