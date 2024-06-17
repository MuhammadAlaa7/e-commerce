import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/auth/controllers/onboarding/onboarding_cubit.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Positioned(
      top: kToolbarHeight,
      right: CSizes.defaultSpace,
      child: TextButton(
        child: Text(
          'Skip',
          style: TextStyle(color: dark ? CColors.primary : Colors.deepPurple),
        ),
        onPressed: () {
          BlocProvider.of<OnBoardingCubit>(context).skipPage();
        },
      ),
    );
  }
}
