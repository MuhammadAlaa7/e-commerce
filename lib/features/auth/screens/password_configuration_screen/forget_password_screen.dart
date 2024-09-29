import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/core/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/core/common/widgets/buttons/default_button.dart';
import 'package:store/core/common/widgets/input_field/input_field.dart';
import 'package:store/features/auth/controllers/forget_password/forget_password_controller.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/constants/text_strings.dart';
import 'package:store/core/utils/validators/custom_validator.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetPassController = ForgetPasswordController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ************************** Headings **************************
              Text(
                AppTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),
              Text(
                AppTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: AppSizes.spaceBetweenSections,
              ),

              /// ************************** FORM ***********************
              Form(
                key: forgetPassController.forgetPasswordFormKey,
                child: Column(
                  children: [
                    InputField(
                      controller: forgetPassController.email,
                      validator: AppValidator.validateEmail,
                      label: 'E-mail',
                      prefixIcon: Iconsax.direct_right,
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBetweenSections,
                    ),

                    //* --------------------- SUBMIT button ----------------------
                    DefaultButton(
                      label: 'Submit',
                      onPressed: () {
                        forgetPassController.sendPasswordResetEmail();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
