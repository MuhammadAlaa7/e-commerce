import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/personalization/screens/profile/widgets/change_name_screen.dart';

import '../../../controllers/user/user_controller.dart';
import 'profile_menu.dart';

class ProfileInformationSection extends StatelessWidget {
  const ProfileInformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Column(
      children: [
        ProfileMenu(
          title: 'Name',
          value: userController.user.value.fullName,
          onTap: () {
            Get.to(()=> const ChangeNameScreen());
          },
        ),
        ProfileMenu(
          title: 'Username',
          value: userController.user.value.username,
          onTap: () {},
        ),
      ],
    );
  }
}
