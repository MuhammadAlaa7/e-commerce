import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/styles/text_styles.dart';
import 'package:store/common/widgets/buttons/default_button.dart';
import 'package:store/common/widgets/buttons/text_button.dart';

import 'package:store/features/auth/controllers/verify_email/verify_email_controller.dart';
import 'package:store/utils/constants22/image_strings.dart';
import 'package:store/utils/constants22/sizes.dart';
import 'package:store/utils/constants22/text_strings.dart';
import 'package:store/utils/helper/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key ,   this.email });

final String? email  ; 

  @override
  Widget build(BuildContext context) {
   final controller =  Get.find<VerifyEmailController>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
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
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  width: CHelperFunctions.screenWidth() * 0.6,
                  image: AssetImage(CImages.deliveredEmailIllustration),
                ),
                const SizedBox(
                  height: CSizes.spaceBetweenSections,
                ),
                Text(
                  CTexts.confirmEmail,
                  style: CTextStyles.titleTextStyle(context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: CSizes.spaceBetweenItems,
                ),
                Text(
                  email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: CSizes.spaceBetweenItems,
                ),
                Text(
                  CTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: CSizes.spaceBetweenSections * 2,
                ),
                // * continue button
                DefaultButton(
                  label: 'Continue',
                  onPressed: () async{
       await controller.checkEmailVerificationStatus();
                  },
                ),
                const SizedBox(
                  height: CSizes.spaceBetweenItems,
                ),
                // *  text button
                CustomTextButton(
                  label: CTexts.resendEmail,
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
