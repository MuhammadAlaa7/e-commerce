import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:store/features/auth/screens/login_screen/login_screen.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // variables
  // --  variables
  final pageController = PageController();

  RxInt currentPageIndex = 0.obs;

  // -- methods

// * update the current index according to the current page
  void onPageChanged(index) {
    currentPageIndex.value = index;
  }

// * -- when tapping on a single dot indicator
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }



//* the current index is connected here , the other functions update it to use it here
  void nextPage() {
    if (currentPageIndex.value != 2) {
      // add 1 to the current page index ==>> because this is the page I want to move to
      // current index is the current page so I want to move to the next page so we add 1 to the current index
      int nextPage = currentPageIndex.value + 1;
      // jump to page ==> jumps to a particular page not only the next page , i can jump to the page 6 from index 1 for example
      pageController.jumpToPage(nextPage);
    } else {
      // when the current index is 2 
      final box = Hive.box('storage');

   
      box.put('isFirstTime', false);

     
      // * go to login screen
      Get.offAll(const LoginScreen());
     
    }
  }


//* skip to the last page 
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
   
  }
}
