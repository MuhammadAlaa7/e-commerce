import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/auth/controllers/onboarding/onboarding_cubit.dart';
import 'package:store/utils/constants22/colors.dart';
import 'package:store/utils/constants22/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
    required this.isLast,
  });

    final bool isLast ; 

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: kBottomNavigationBarHeight,
      right: CSizes.defaultSpace,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            side: BorderSide(color: dark ? CColors.primary : Colors.deepPurple),
            //    shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: dark ? CColors.primary : Colors.deepPurple),

        child:  Text(isLast ? 'Get Started':'Next'),

        //   child: const Icon(Iconsax.arrow_right_3),
        onPressed: () {
          BlocProvider.of<OnBoardingCubit>(context).nextPage(context);
        },
      ),
    );
  }
}
