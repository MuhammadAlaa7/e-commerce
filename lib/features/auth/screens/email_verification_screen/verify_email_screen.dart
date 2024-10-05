import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/buttons/default_button.dart';
import 'package:store/core/common/widgets/buttons/text_button.dart';

import 'package:store/features/auth/controllers/verify_email/verify_email_controller.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/constants/text_strings.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, });


  @override
  Widget build(BuildContext context) {
    //* arguments is email
    String? email = Get.arguments;
    final controller = VerifyEmailController.instance ; 
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          //* log out button 
          IconButton(
            onPressed: () {
              controller.logOut();
            },
            icon: const Icon(
              CupertinoIcons.clear,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  width: AppHelperFunctions.screenWidth() * 0.6,
                  image: const AssetImage(AppImages.deliveredEmailIllustration),
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenSections,
                ),
                Text(
                  AppTexts.confirmEmail,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenItems,
                ),
                Text(
                  email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenItems,
                ),
                Text(
                  AppTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenSections * 2,
                ),
                // * continue button
                DefaultButton(
                  label: 'Continue',
                  onPressed: () async {
                    await controller.checkEmailVerificationStatus();
                  },
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenItems,
                ),
                // *  text button  >>  resend email
                CustomTextButton(
                  label: AppTexts.resendEmail,
                  onPressed: () {
                    controller.sendEmailVerification();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
