import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/buttons/outlined_button.dart';
import 'package:store/features/personalization/controllers/user/user_controller.dart';
import 'package:store/core/utils/constants/sizes.dart';

import 'account_settings_section.dart';
import 'app_settings_section.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.sm),
      child: Column(
        children: [
          const AccountSettingsSection(),
          const SizedBox(
            height: AppSizes.spaceBetweenSections,
          ),
          const AppAccountSection(),
          const SizedBox(
            height: AppSizes.spaceBetweenSections,
          ),
          CustomOutlinedButton(
            label: 'Logout',
            onPressed: () {
              UserController.instance.logOut();
            },
          ),
          const SizedBox(
            height: AppSizes.spaceBetweenSections * 2.5,
          ),
        ],
      ),
    );
  }
}
