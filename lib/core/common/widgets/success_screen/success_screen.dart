import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:store/core/common/styles/spacing_styles.dart';
import 'package:store/core/common/widgets/buttons/default_button.dart';
import 'package:store/core/utils/constants/sizes.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: CSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                image,
                //  repeat: false,
                width: MediaQuery.of(context).size.width * 0.8,
              ),

              const SizedBox(
                height: AppSizes.spaceBetweenSections,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: AppSizes.spaceBetweenSections,
              ),
              //?
              // * continue button
              // ?
              DefaultButton(
                width: MediaQuery.of(context).size.width * 0.6,
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
