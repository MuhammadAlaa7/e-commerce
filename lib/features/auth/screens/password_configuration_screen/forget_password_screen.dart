import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/styles/text_styles.dart';
import 'package:store/common/widgets/buttons/default_button.dart';
import 'package:store/common/widgets/input_field/input_field.dart';
import 'package:store/features/auth/screens/password_configuration_screen/password_reset_screen.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/constants/text_strings.dart';
import 'package:store/utils/helper/helper_functions.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                CTexts.forgetPasswordTitle,
                style: CTextStyles.titleTextStyle(context),
              ),
              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              Text(
                CTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: CSizes.spaceBetweenSections,
              ),
              const InputField(
                label: 'E-mail',
                prefixIcon: Iconsax.direct_right,
              ),
              const SizedBox(
                height: CSizes.spaceBetweenSections,
              ),
              DefaultButton(
                label: 'Submit',
                onPressed: () {
                  CHelperFunctions.goTo(
                    context,
                    const PasswordResetScreen(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
