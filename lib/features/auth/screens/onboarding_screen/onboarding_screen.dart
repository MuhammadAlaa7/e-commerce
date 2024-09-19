import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/auth/controllers/onboarding/onboarding_cubit.dart';
import 'package:store/features/auth/controllers/onboarding/onboarding_states.dart';
import 'package:store/utils/constants22/image_strings.dart';
import 'package:store/utils/constants22/text_strings.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<OnBoardingCubit>(context);
    return Scaffold(
      body: Stack(
        children: [
          // * -- first label of the stack
          PageView(
            controller: cubit.pageController,
            onPageChanged: (index) {
              cubit.onPageChanged(index);
            },
            children: const [
              // * first page
              OnBoardingPage(
                image: CImages.onBoardingImage1,
                title: CTexts.onBoardingTitle1,
                subTitle: CTexts.onBoardingSubTitle1,
              ),

              // * second page
              OnBoardingPage(
                image: CImages.onBoardingImage2,
                title: CTexts.onBoardingTitle2,
                subTitle: CTexts.onBoardingSubTitle2,
              ),

              // * third page
              OnBoardingPage(
                image: CImages.onBoardingImage3,
                title: CTexts.onBoardingTitle3,
                subTitle: CTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // * -- second label of the stack
          const OnBoardingSkipButton(),

          // * -- Third label of the stack
          const OnBoardingDotNavigation(),

          // * -- forth label of the stack  [Next Button ]
          BlocBuilder<OnBoardingCubit, OnboardingStates>(
            builder: (context, state) {
              if (state is LastPageState) {
                return const OnboardingNextButton(isLast: true);
              } else {
                return const OnboardingNextButton(isLast: false);
              }
            },
          ),
        ],
      ),
    );
  }
}
