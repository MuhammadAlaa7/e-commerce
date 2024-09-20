import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/core/common/widgets/buttons/default_button.dart';
import 'package:store/core/common/widgets/input_field/input_field.dart';
import 'package:store/features/auth/controllers/signup/signup_controller.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/constants/text_strings.dart';
import 'package:store/core/utils/validators/custom_validator.dart';

import 'terms_conditions.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signupController = Get.find<SignUpController>();
    return Form(
      key: signupController.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                // * firstName and lastName
                child: InputField(
                  controller: signupController.firstName,
                  validator: (value) => AppValidator.validateEmptyText(
                      fieldName: AppTexts.firstName, value: value),
                  label: AppTexts.firstName,
                  prefixIcon: Iconsax.user,
                ),
              ),
              const SizedBox(
                width: AppSizes.spaceBetweenInputFields,
              ),
              Expanded(
                child: InputField(
                  controller: signupController.lastName,
                  validator: (value) => AppValidator.validateEmptyText(
                      fieldName: AppTexts.lastName, value: value),
                  label: AppTexts.lastName,
                  prefixIcon: Iconsax.user,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppSizes.spaceBetweenInputFields,
          ),
          InputField(
            controller: signupController.userName,
            validator: (value) => AppValidator.validateEmptyText(
                fieldName: AppTexts.username, value: value),
            label: AppTexts.username,
            prefixIcon: Iconsax.user_edit,
          ),
          const SizedBox(
            height: AppSizes.spaceBetweenInputFields,
          ),
          InputField(
            controller: signupController.email,
            validator: (value) => AppValidator.validateEmail(value),
            label: AppTexts.email,
            prefixIcon: Iconsax.direct,
          ),
          const SizedBox(
            height: AppSizes.spaceBetweenInputFields,
          ),
          InputField(
            controller: signupController.phoneNumber,
            validator: (value) => AppValidator.validatePhoneNumber(value),
            label: AppTexts.phoneNumber,
            prefixIcon: Icons.call,
          ),
          const SizedBox(
            height: AppSizes.spaceBetweenInputFields,
          ),
          // * password
          // ****************** update any observed variables here ****************
          Obx(
            () => InputField(
              controller: signupController.password,
              validator: (value) => AppValidator.validatePassword(value),
              label: AppTexts.password,
              prefixIcon: Iconsax.password_check,
              obscureText: signupController.hidePassword.value,
              suffixIcon: IconButton(
                onPressed: () {
                  signupController.hidePassword.value =
                      !signupController.hidePassword.value;
                },
                icon: Icon(signupController.hidePassword.value
                    ? Iconsax.eye
                    : Iconsax.eye_slash),
              ),
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBetweenSections,
          ),

          // * terms and conditions with checkbox button

          const TermsAndConditionsCheckBox(),

          const SizedBox(
            height: AppSizes.spaceBetweenSections,
          ),
          // * Sign Up button
          DefaultButton(
              label: AppTexts.createAccount,
              //* here we pass the signup method not execute it directly
              onPressed: signupController.signUp)
        ],
      ),
    );
  }
}
