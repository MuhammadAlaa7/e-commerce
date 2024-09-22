import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/buttons/default_button.dart';
import 'package:store/features/auth/controllers/signup/signup_controller.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/constants/text_strings.dart';
import 'form_input_fields.dart';
import 'terms_conditions.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final signUpController = Get.put( SignUpController());
    SignUpController signUpController = SignUpController.instance;
    return Form(
      key: signUpController.signUpFormKey,
      child: Column(
        children: [
          // * sign up form fields
          FormInputFields(signUpController: signUpController),
          const SizedBox(
            height: AppSizes.spaceBetweenSections,
          ),

          // * terms and conditions with checkbox button

          const TermsAndConditionsCheckBox(),

          const SizedBox(
            height: AppSizes.spaceBetweenSections,
          ),
          // * Sign Up create account button
          DefaultButton(
            label: AppTexts.createAccount,
            //* here we pass the signUp method not execute it directly
            onPressed: signUpController.signUp,
          )
        ],
      ),
    );
  }
}
