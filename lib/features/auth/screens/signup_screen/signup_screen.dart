import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/login_signup/form_divider.dart';
import 'package:store/core/common/widgets/login_signup/social_buttons.dart';
import 'package:store/features/auth/screens/signup_screen/widgets/signup_form.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppSizes.defaultSpace,
              right: AppSizes.defaultSpace,
              bottom: AppSizes.defaultSpace,
              top: 0,
            ),
            child: Column(
              children: [
                /// * Title

                Text(
                  AppTexts.signUpTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenSections,
                ),
                // * sign up form

                const SignUpForm(),

                const SizedBox(
                  height: AppSizes.spaceBetweenSections,
                ),

                // * Divider
                const FormDivider(
                  dividerText: AppTexts.orSignUpWith,
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenSections,
                ),
                // * footer 
                const SocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
