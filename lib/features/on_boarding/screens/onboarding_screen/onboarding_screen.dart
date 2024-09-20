import 'package:flutter/material.dart';
import 'package:store/features/on_boarding/controllers/onboarding/on_boarding_controller.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/constants/text_strings.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final cubit = BlocProvider.of<OnBoardingCubit>(context);
    final controller = OnBoardingController.instance;
    return Scaffold(
      body: Stack(
        children: [
          // * -- first label of the stack
          // controller here is the intermediary between the buttons and the pages 
          // to ba able to control the pages views through the next and skip buttons 
          PageView(
            controller: controller.pageController,
            onPageChanged: (index) {
              controller.onPageChanged(index);
            },
            children: const [
              // * first page
              OnBoardingPage(
                image: AppImages.onBoardingImage1,
                title: AppTexts.onBoardingTitle1,
                subTitle: AppTexts.onBoardingSubTitle1,
              ),

              // * second page
              OnBoardingPage(
                image: AppImages.onBoardingImage2,
                title: AppTexts.onBoardingTitle2,
                subTitle: AppTexts.onBoardingSubTitle2,
              ),

              // * third page
              OnBoardingPage(
                image: AppImages.onBoardingImage3,
                title: AppTexts.onBoardingTitle3,
                subTitle: AppTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // * -- second label of the stack
          const OnBoardingSkipButton(),

          // * -- Third label of the stack   >> from smooth page indicator package
          
          const OnBoardingDotNavigation(),

          const OnboardingNextButton(),

 
        ],
      ),
    );
  }
}
