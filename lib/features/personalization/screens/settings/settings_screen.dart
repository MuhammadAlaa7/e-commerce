import 'package:flutter/material.dart';
import 'package:store/features/personalization/screens/settings/widgets/settings_header.dart';

import 'widgets/settings_body.dart';

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
