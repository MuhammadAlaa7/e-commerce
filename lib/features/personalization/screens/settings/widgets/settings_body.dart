import 'package:flutter/material.dart';
import 'package:store/common/widgets/buttons/outlined_button.dart';
import 'package:store/features/auth/controllers/login/login_controller.dart';
import 'package:store/features/personalization/controllers/user/user_controller.dart';
import 'package:store/utils/constants22/sizes.dart';

import 'account_settings_section.dart';
import 'app_settings_section.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CSizes.sm),
      child: Column(
        children: [
          const AccountSettingsSection(),
          const SizedBox(
            height: CSizes.spaceBetweenSections,
          ),
          const AppAccountSection(),
          const SizedBox(
            height: CSizes.spaceBetweenSections,
          ),
          CustomOutlinedButton(
            label: 'Logout',
            onPressed: () {
              UserController.instance.logOut();
            },
          ),
          const SizedBox(
            height: CSizes.spaceBetweenSections * 2.5,
          ),
        ],
      ),
    );
  }
}
