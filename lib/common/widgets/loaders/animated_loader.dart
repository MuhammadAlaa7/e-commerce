import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:store/utils/constants22/colors.dart';
import 'package:store/utils/constants22/image_strings.dart';

class AnimationLoaderWidget extends StatelessWidget {
  /// A widget for displaying an animated loader indicator with optional text and action button
  ///

  /// Parameters:
  ///   - text: The text to be displayed below the animation
  ///   - animation : The path to the lottie animation file
  ///   - showAction: Whether to show the action button below the text
  ///   - actionText: The text to be displayed on the action button
  ///   - onActionPressed: callback function to be executed when the action button is pressed

  /// Default constructor for CAnimationLoaderWidget
  const AnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animationImage,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animationImage;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            animationImage,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          const SizedBox(height: 24),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: CColors.dark,
                    ),
                    child: Text(
                      actionText ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: CColors.light),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
