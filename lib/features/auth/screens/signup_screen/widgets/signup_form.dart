import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/buttons/default_button.dart';
import 'package:store/common/widgets/input_field/input_field.dart';
import 'package:store/features/auth/controllers/signup/signup_controller.dart';
import 'package:store/utils/constants22/sizes.dart';
import 'package:store/utils/constants22/text_strings.dart';
import 'package:store/utils/validators/custom_validator.dart';

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
                  validator: (value) =>
                      CValidator.validateEmptyText(fieldName:  CTexts.firstName,value:  value),
                  label: CTexts.firstName,
                  prefixIcon: Iconsax.user,
                ),
              ),
              const SizedBox(
                width: CSizes.spaceBetweenInputFields,
              ),
              Expanded(
                child: InputField(
                  controller: signupController.lastName,
                  validator: (value) =>
                      CValidator.validateEmptyText( fieldName: CTexts.lastName,value:  value),
                  label: CTexts.lastName,
                  prefixIcon: Iconsax.user,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: CSizes.spaceBetweenInputFields,
          ),
          InputField(
            controller: signupController.userName,
            validator: (value) =>
                CValidator.validateEmptyText(fieldName: CTexts.username,value: value),
            label: CTexts.username,
            prefixIcon: Iconsax.user_edit,
          ),
          const SizedBox(
            height: CSizes.spaceBetweenInputFields,
          ),
          InputField(
            controller: signupController.email,
            validator: (value) => CValidator.validateEmail(value),
            label: CTexts.email,
            prefixIcon: Iconsax.direct,
          ),
          const SizedBox(
            height: CSizes.spaceBetweenInputFields,
          ),
          InputField(
            controller: signupController.phoneNumber,
            validator: (value) => CValidator.validatePhoneNumber(value),
            label: CTexts.phoneNumber,
            prefixIcon: Icons.call,
          ),
          const SizedBox(
            height: CSizes.spaceBetweenInputFields,
          ),
          // * password
          // ****************** update any observed variables here ****************
          Obx(
            () => InputField(
              controller: signupController.password,
              validator: (value) => CValidator.validatePassword(value),
              label: CTexts.password,
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
            height: CSizes.spaceBetweenSections,
          ),

          // * terms and conditions with checkbox button 

          const TermsAndConditionsCheckBox(),

          const SizedBox(
            height: CSizes.spaceBetweenSections,
          ),
          // * Sign Up button
          DefaultButton(
              label: CTexts.createAccount,
              //* here we pass the signup method not execute it directly
              onPressed: signupController.signUp)
        ],
      ),
    );
  }
}
