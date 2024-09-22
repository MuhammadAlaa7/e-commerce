import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/buttons/default_button.dart';
import 'package:store/core/common/widgets/buttons/text_button.dart';
import 'package:store/features/auth/controllers/forget_password/forget_password_controller.dart';
import 'package:store/features/auth/screens/login_screen/login_screen.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/constants/text_strings.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
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
        padding: const EdgeInsets.all(AppSizes.md),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // * ************************  image *****************
              Image(
                width: AppHelperFunctions.screenWidth() * 0.6,
                image: AssetImage(AppImages.deliveredEmailIllustration),
              ),
              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),
              // ********************* email - title - subtitle *****************
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),
              Text(
                AppTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),
              Text(
                AppTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: AppSizes.spaceBetweenSections,
              ),

              // *********************** Buttons ********************8
              DefaultButton(
                label: 'Done',
                onPressed: () {
                  Get.offAll(() => const LoginScreen());
                },
              ),
              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),
              CustomTextButton(
                label: 'Resend Email',
                onPressed: () {
                  controller.resendPasswordResetEmail(email);
                },
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
