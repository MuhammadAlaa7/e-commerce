import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

import '../../common/widgets/loaders/animated_loader.dart';

/// A utility class for managing a full screen loader dialog
class FullScreenLoader {
  /// Open a full-screen loader dialog with a given text and animation

// *method 1

  /// This method doesn't return anything
  ///
  /// Parameters
  ///   [text] : The text to be displayed in the loading dialog
  ///   [animationImage] : The Lottie animation to be shown
  static void openLoadingDialog(String text, String animationImage) {
    // from flutter dialogs
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible:
          false, // the dialog can't be dismissed by tapping outside it
      builder: (_) {
        // A custom widget (PopScope) is used to manage whether the dialog can be popped (dismissed).
        // Here, canPop: false >  means it cannot be dismissed using the [ back button ].
        return PopScope(
          canPop: false,
          child: Container(
            color: AppHelperFunctions.isDarkMode(Get.context!)
                ? Colors.black
                : Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  AnimationLoaderWidget(
                    animationImage: animationImage,
                    text: text,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

// *method 2

  // * close the currently opened loading dialog
  static void closeLoadingDialog() {
    Navigator.pop(Get.overlayContext!);
  }
}
