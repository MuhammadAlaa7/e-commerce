import 'package:flutter/material.dart';
import 'package:store/common/styles/spacing_styles.dart';
import 'package:store/common/widgets/login_signup/form_divider.dart';
import 'package:store/common/widgets/login_signup/social_buttons.dart';
import 'package:store/utils/constants22/sizes.dart';
import 'package:store/utils/constants22/text_strings.dart';

import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //* -- Login Header
              LoginScreenHeader(),

              // * -- Login Form
              LoginForm(),

              //* Divider
              FormDivider(
                dividerText: CTexts.orSignInWith,
              ),

              SizedBox(
                height: CSizes.spaceBetweenSections,
              ),

              // * Login Footer
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
