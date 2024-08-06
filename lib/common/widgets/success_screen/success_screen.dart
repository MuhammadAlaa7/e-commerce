import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:store/common/styles/spacing_styles.dart';
import 'package:store/common/styles/text_styles.dart';
import 'package:store/common/widgets/buttons/default_button.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
    this.buttonLabel = 'Continue',
  });

  final String image, title, subTitle, buttonLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: CSpacingStyle.paddingWithAppBarHeight * 2,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Lottie.asset(
                  repeat: false , 
                CImages.staticSuccessIllustration,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              // Image(
              //   width: CHelperFunctions.screenWidth(context) * 0.6,
              //   image: AssetImage(image),
              // ),
              const SizedBox(
                height: CSizes.spaceBetweenSections,
              ),
              Text(
                title,
                style: CTextStyles.titleTextStyle(context),
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CSizes.spaceBetweenSections * 2,
              ),
              //?
              // * continue button
              // ?
              DefaultButton(
                label: buttonLabel,
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
