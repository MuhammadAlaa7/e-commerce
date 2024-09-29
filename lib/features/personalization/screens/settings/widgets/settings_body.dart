import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/buttons/outlined_button.dart';
import 'package:store/features/personalization/controllers/user_controller.dart';
import 'package:store/core/utils/constants/sizes.dart';

import 'account_settings_section.dart';
import 'app_settings_section.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.sm),
      child: Column(
        children: [
          // * [1] -- account settings section
          const AccountSettingsSection(),
          const SizedBox(
            height: AppSizes.spaceBetweenSections,
          ),

          // * [2] -- app settings section
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
