import 'package:flutter/material.dart';
import 'package:store/features/personalization/screens/settings/widgets/settings_header.dart';

import 'widgets/settings_body.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
/// test comment 
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // * Header
            AccountHeader(),
            //* Body
            AccountBody(),
          ],
        ),
      ),
    );
  }
}
