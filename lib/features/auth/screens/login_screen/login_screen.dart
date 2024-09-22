import 'package:flutter/material.dart';
import 'package:store/core/common/styles/spacing_styles.dart';
import 'package:store/core/common/widgets/login_signup/form_divider.dart';
import 'package:store/core/common/widgets/login_signup/social_buttons.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/constants/text_strings.dart';

import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: CSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                //* -- Login screen Header [ image & title , subtitle  ]
                LoginHeader(),
      
                // * -- Login form , email and password , remember me , forgot password , login buttons
                LoginForm(),
      
                //* Divider with the text between 
                FormDivider(
                  dividerText: AppTexts.orSignInWith,
                ),
      
                SizedBox(
                  height: AppSizes.spaceBetweenSections,
                ),
      
                // * Login Footer [ facebook , google  ] buttons
                SocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
