
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/core/common/widgets/buttons/default_button.dart';
import 'package:store/core/common/widgets/input_field/input_field.dart';
import 'package:store/features/auth/controllers/forget_password/forget_password_controller.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/constants/text_strings.dart';
import 'package:store/core/utils/validators/custom_validator.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final controller = Get.put(ForgetPasswordController());
  @override
  void initState() {
    controller.email.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                key: controller.forgetPasswordFormKey,
                child: InputField(
                  controller: controller.email,
                  validator: AppValidator.validateEmail,
                  label: 'E-mail',
                  prefixIcon: Iconsax.direct_right,
                ),
              ),
              const SizedBox(
                height: AppSizes.spaceBetweenSections,
              ),

              //* --------------------- SUBMIT button ----------------------
              DefaultButton(
                label: 'Submit',
                onPressed: () {
                  controller.sendPasswordResetEmail();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
