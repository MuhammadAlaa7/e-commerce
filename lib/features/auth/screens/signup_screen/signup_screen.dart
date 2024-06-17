import 'package:flutter/material.dart';
import 'package:store/common/styles/text_styles.dart';
import 'package:store/common/widgets/login_signup/form_divider.dart';
import 'package:store/common/widgets/login_signup/social_buttons.dart';
import 'package:store/features/auth/screens/signup_screen/widgets/signup_form.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/constants/text_strings.dart';

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
              left: CSizes.defaultSpace,
              right: CSizes.defaultSpace,
              top: 0,
              bottom: CSizes.defaultSpace,
            ),
            child: Column(
              children: [
                /// * Title

                Text(
                  CTexts.signUpTitle,
                  style: CTextStyles.titleTextStyle(context),
                ),
                const SizedBox(
                  height: CSizes.spaceBetweenSections,
                ),
                // * sign up form

                const SignUpForm(),

                const SizedBox(
                  height: CSizes.spaceBetweenSections,
                ),

                // * Divider
                const FormDivider(
                  dividerText: CTexts.orSignUpWith,
                ),
                const SizedBox(
                  height: CSizes.spaceBetweenSections,
                ),
                // * footer
              const  SocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
