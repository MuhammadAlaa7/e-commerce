import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/buttons/default_button.dart';
import 'package:store/common/widgets/buttons/outlined_button.dart';
import 'package:store/common/widgets/buttons/text_button.dart';
import 'package:store/common/widgets/input_field/input_field.dart';
import 'package:store/features/auth/controllers/login/login_controller.dart';
import 'package:store/features/auth/screens/password_configuration_screen/forget_password_screen.dart';
import 'package:store/features/auth/screens/signup_screen/signup_screen.dart';
import 'package:store/utils/constants22/colors.dart';
import 'package:store/utils/constants22/sizes.dart';
import 'package:store/utils/constants22/text_strings.dart';
import 'package:store/utils/helper/helper_functions.dart';
import 'package:store/utils/validators/custom_validator.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   final controller = Get.put(LogInController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: CSizes.spaceBetweenSections,
        ),
        child: Column(
          children: [
            // * email field
            InputField(
              label: CTexts.email,
              prefixIcon: Iconsax.direct,
              controller: controller.email,
              validator: (value) => CValidator.validateEmail(value),
            ),
            const SizedBox(
              height: CSizes.spaceBetweenInputFields,
            ),
            // * password field
            // the validator here must not be to follow the password pattern but rather just not to be empty
            // so the login password only must not be empty
            Obx(
              () => InputField(
                controller: controller.password,
                validator: (value) =>
                 CValidator.validateEmptyText(fieldName: CTexts.password,value:  value),
                //    CValidator.validatePassword(value),
                label: CTexts.password,
                prefixIcon: Iconsax.password_check,
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.hidePassword.value =
                        !controller.hidePassword.value;
                  },
                  icon: Icon(
                    controller.hidePassword.value
                        ? Iconsax.eye
                        : Iconsax.eye_slash,
                  ),
                ),
                obscureText: controller.hidePassword.value,
              ),
            ),
            const SizedBox(
              height: CSizes.spaceBetweenInputFields / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // * remember me check box
                Obx(
                  () => Row(
                    children: [
                     Checkbox(
                        fillColor: MaterialStateProperty.all(
                            controller.rememberMe.value
                                ? CColors.primary
                                : Colors.transparent),
                        value: controller.rememberMe.value, 
                        onChanged: (value) {
                          controller.rememberMe.value =
                              !controller.rememberMe.value;
                        },
                      ),
                      const Text(CTexts.rememberMe),
                    ],
                  ),
                ),
                // * forget password
                CustomTextButton(
                  label: CTexts.forgetPassword,
                  onPressed: () {
                    CHelperFunctions.navigateToScreen(
                        context, const ForgetPasswordScreen());
                  },
                ),
              ],
            ),
            const SizedBox(
              height: CSizes.spaceBetweenItems,
            ),
            // * sign in button
            DefaultButton(
              label: CTexts.signIn,
              onPressed: () {
              controller.login();
              },
            ),
            const SizedBox(
              height: CSizes.spaceBetweenItems,
            ),
            // * sign up button

            CustomOutlinedButton(
              label: CTexts.createAccount,
              onPressed: () {
                // * navigate to sign up screen
                CHelperFunctions.navigateToScreen(
                  context,
                  const SignUpScreen(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
