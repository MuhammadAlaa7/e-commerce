import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/core/common/widgets/buttons/default_button.dart';
import 'package:store/core/common/widgets/buttons/outlined_button.dart';
import 'package:store/core/common/widgets/buttons/text_button.dart';
import 'package:store/core/common/widgets/input_field/input_field.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/features/auth/controllers/login/login_controller.dart';
import 'package:store/features/auth/screens/password_configuration_screen/forget_password_screen.dart';
import 'package:store/features/auth/screens/signup_screen/signup_screen.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/constants/text_strings.dart';
import 'package:store/core/utils/validators/custom_validator.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController()) ; 
    return Form(
      key: loginController.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.spaceBetweenSections,
        ),
        child: Column(
          children: [
            // * email field
            InputField(
              label: AppTexts.email,
              prefixIcon: Iconsax.direct,
              controller: loginController.email,
              validator: (value) => AppValidator.validateEmail(value),
            ),
            const SizedBox(
              height: AppSizes.spaceBetweenInputFields,
            ),
            // * password field
            // the validator here must not be to follow the password pattern
            // but rather just not to be empty
            // so the login password only must not be empty unlike the sign up password
            Obx(
              () => InputField(
                controller: loginController.password,
                validator: (value) => AppValidator.validateEmptyText(
                  fieldName: AppTexts.password,
                  value: value,
                ),
                //    CValidator.validatePassword(value),
                label: AppTexts.password,

                prefixIcon: Iconsax.password_check,
                suffixIcon: IconButton(
                  onPressed: () {
           
                    loginController.hidePassword.toggle();
                  },
                  icon: Icon(
                    loginController.hidePassword.value
                        ? Iconsax.eye
                        : Iconsax.eye_slash,
                  ),
                ),
                obscureText: loginController.hidePassword.value,
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBetweenInputFields / 2,
            ),

            //  * remember me and forget password section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // * remember me check box
                Obx(
                  () => Row(
                    children: [
                      Checkbox(
                        fillColor: WidgetStateProperty.all(
                          loginController.rememberMe.value
                              ? AppColors.primary
                              : Colors.transparent,
                        ),
                        value: loginController.rememberMe.value,
                        onChanged: (value) {
                          loginController.rememberMe.value = value!;
                        },
                      ),
                      const Text(AppTexts.rememberMe),
                    ],
                  ),
                ),
                // * forget password
                CustomTextButton(
                  label: AppTexts.forgetPassword,
                  onPressed: () {
                    // You should navigate using Getx to inform it when the screen is closed from the stack
                  Get.toNamed(AppRoutes.forgetPassword); // forget password screen;
                  },
                ),
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBetweenItems,
            ),
            // * sign in button
            DefaultButton(
              label: AppTexts.signIn,
              onPressed: () {
                log('login pressed');
                loginController.login();
              },
            ),
            const SizedBox(
              height: AppSizes.spaceBetweenItems,
            ),
            // * sign up button

            CustomOutlinedButton(
              label: AppTexts.createAccount,
              onPressed: () {
                Get.toNamed(AppRoutes.signUp);
              },
            ),
          ],
        ),
      ),
    );
  }
}
