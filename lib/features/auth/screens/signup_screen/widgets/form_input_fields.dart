import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/core/common/widgets/input_field/input_field.dart';
import 'package:store/features/auth/controllers/signup/signup_controller.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/constants/text_strings.dart';
import 'package:store/core/utils/validators/custom_validator.dart';

class FormInputFields extends StatelessWidget {
  const FormInputFields({
    super.key,
    required this.signUpController,
  });

  final SignUpController signUpController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              // * firstName and lastName
              child: InputField(
                controller: signUpController.firstName,
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
                controller: signUpController.lastName,
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
          controller: signUpController.userName,
          validator: (value) => AppValidator.validateEmptyText(
            fieldName: AppTexts.username,
            value: value,
          ),
          label: AppTexts.username,
          prefixIcon: Iconsax.user_edit,
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenInputFields,
        ),
        InputField(
          controller: signUpController.email,
          validator: (value) => AppValidator.validateEmail(value),
          label: AppTexts.email,
          prefixIcon: Iconsax.direct,
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenInputFields,
        ),
        InputField(
          controller: signUpController.phoneNumber,
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
            controller: signUpController.password,
            validator: (value) => AppValidator.validatePassword(value),
            label: AppTexts.password,
            prefixIcon: Iconsax.password_check,
            obscureText: signUpController.isSecureText.value,
            suffixIcon: IconButton(
              onPressed: () {
                signUpController.isSecureText.value =
                    !signUpController.isSecureText.value;
              },
              icon: Icon(signUpController.isSecureText.value
                  ? Iconsax.eye
                  : Iconsax.eye_slash),
            ),
          ),
        ),
      ],
    );
  }
}
