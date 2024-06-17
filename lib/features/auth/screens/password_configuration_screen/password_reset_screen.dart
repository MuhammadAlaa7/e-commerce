import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/common/styles/text_styles.dart';
import 'package:store/common/widgets/buttons/default_button.dart';
import 'package:store/common/widgets/buttons/text_button.dart';
import 'package:store/features/auth/screens/login_screen/login_screen.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/constants/text_strings.dart';
import 'package:store/utils/helper/helper_functions.dart';

class PasswordResetScreen extends StatelessWidget {
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.clear,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                width: CHelperFunctions.screenWidth(context) * 0.6,
                image: AssetImage(CImages.deliveredEmailIllustration),
              ),
              const SizedBox(
                height: CSizes.spaceBetweenSections,
              ),
              Text(
                CTexts.changeYourPasswordTitle,
                style: CTextStyles.titleTextStyle(context),
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              Text(
                CTexts.changeYourPasswordSubTitle,
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
                label: 'Done',
                onPressed: () {
                  CHelperFunctions.goTo(context, const LoginScreen());
                },
              ),
              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              CustomTextButton(
                label: 'Resend Email',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),

      // body: Center(
      //   child: SuccessScreen(
      //     image: CImages.deliveredEmailIllustration,
      //     title: CTexts.changeYourPasswordTitle,
      //     subTitle: CTexts.changeYourPasswordSubTitle,
      //     buttonLabel: 'Done',
      //     onPressed: () {},
      //   ),
      // ),
    );
  }
}
