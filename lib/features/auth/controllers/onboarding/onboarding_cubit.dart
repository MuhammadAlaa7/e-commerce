

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:store/authentication_cubit.dart';
import 'package:store/features/auth/controllers/onboarding/onboarding_states.dart';
import 'package:store/features/auth/screens/login_screen/login_screen.dart';
import 'package:store/utils/helper/helper_functions.dart';

class OnBoardingCubit extends Cubit<OnboardingStates> {
  OnBoardingCubit() : super(OnboardingInitialState());

  // --  variables
  bool isLast = false;
  final pageController = PageController();
  int currentPageIndex = 0;

  // -- methods

// * change next button label
  void changeButtonLabel() {
    if (currentPageIndex == 2) {
      isLast = true;
      emit(LastPageState());
    } else {
      isLast = false;
      emit(OnboardingInitialState());
    }
  }

// * -- when tapping on a single dot indicator
  void dotNavigationClick(index) {
    currentPageIndex = index;
    pageController.jumpToPage(index);
    changeButtonLabel();
  }

// * update the current index according to the current page
  void onPageChanged(index) {
    currentPageIndex = index;
    changeButtonLabel();
  }

// the current index is connected here , the other functions update it to use it here
  void nextPage(BuildContext context) {
    if (currentPageIndex == 2) {
     final box = Hive.box('storage');
     
      if (kDebugMode) {
        print('***************************** before pressing next button   *************');
        print('${box.get('isFirstTime')}');
      }
     box.put('isFirstTime', false);

      if (kDebugMode) {
        print('***************************** after next button  *************');
        print('${box.get('isFirstTime')}');
      }
      // * go to login screen
          Get.offAll(const LoginScreen());
    } else {
      // add 1 to the current page index ==>> because this is the page I want to move to
      // current index is the current page so I want to move to the next page so we add 1 to the current index
      int page = currentPageIndex + 1;
      // jump to page ==> jumps to a particular page not only the next page , i can jump to the page 6 from index 1 for example
      pageController.jumpToPage(page);
      changeButtonLabel();
      
    }
  }

  void skipPage() {
    currentPageIndex = 2;
    pageController.jumpToPage(2);
    isLast = true;
  }
}
