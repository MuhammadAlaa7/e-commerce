import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controllers/user_controller.dart';
import 'profile_menu.dart';

class PersonalInformationSection extends StatelessWidget {
  const PersonalInformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    return Column(
      children: [
        ProfileMenu(
          title: 'User Id',
          value: userController.user.value.id,
          onTap: () {},
          icon: Iconsax.copy,
        ),
       
        ProfileMenu(
            title: 'Phone Number',
            value: userController.user.value.phoneNumber,
            onTap: () {}),
        ProfileMenu(title: 'Gender', value: 'Male', onTap: () {}),
        ProfileMenu(title: 'Date of Birth', value: 'Jul 25 1998', onTap: () {}),
      ],
    );
  }
}
