import 'package:flutter/material.dart';
import 'package:store/common/widgets/buttons/outlined_button.dart';
import 'package:store/features/personalization/screens/settings/widgets/account_settings_section.dart';
import 'package:store/features/personalization/screens/settings/widgets/app_settings_section.dart';
import 'package:store/features/personalization/screens/settings/widgets/settings_header.dart';
import 'package:store/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // * Header
            SettingsHeader(),
            //* Body
            SettingsBody(),
          ],
        ),
      ),
    );
  }
}

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
            onPressed: () {},
          ),
          const SizedBox(
            height: CSizes.spaceBetweenSections * 2.5,
          ),
        ],
      ),
    );
  }
}
