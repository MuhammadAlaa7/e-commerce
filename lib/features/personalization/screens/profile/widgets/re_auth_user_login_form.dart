import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/buttons/default_button.dart';
import 'package:store/common/widgets/input_field/input_field.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/constants/text_strings.dart';
import 'package:store/utils/validators/custom_validator.dart';

import '../../../controllers/user/user_controller.dart';

class ReAuthUserLoginForm extends StatelessWidget {
  const ReAuthUserLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Re-Authentication User',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding:const  EdgeInsets.all(CSizes.md),
        child: Form(
          key: userController.reAuthFormKey,
          child: Column(
            children: [
              InputField(
                controller: userController.verifyEmail,
                label: 'Email',
                prefixIcon: Iconsax.direct,
                validator: (value) => CValidator.validateEmptyText(
                  fieldName: 'Email',
                  value: value,
                ),
              ),
              const SizedBox(height: CSizes.spaceBetweenInputFields),
                   Obx(
                () => InputField(
                  controller: userController.verifyPassword,
                  validator: (value) => CValidator.validateEmptyText(
                      fieldName: CTexts.password, value: value),
                  //    CValidator.validatePassword(value),
                  label: CTexts.password,
                  prefixIcon: Iconsax.password_check,
                  suffixIcon: IconButton(
                    onPressed: () {
                      userController.hidePassword.value =
                          !userController.hidePassword.value;
                    },
                    icon: Icon(
                      userController.hidePassword.value
                          ? Iconsax.eye
                          : Iconsax.eye_slash,
                    ),
                  ),
                  obscureText: userController.hidePassword.value,
                ),
              ),
              const SizedBox(height: CSizes.spaceBetweenSections),
              DefaultButton(
                label: 'Verify',
                onPressed: () {
                  userController.reAuthenticateUserWithEmailAndPassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
