import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/core/common/widgets/texts/section_heading.dart';
import 'package:store/data/services/services_controller.dart';
import 'package:store/features/personalization/screens/settings/widgets/settings_menu_tile.dart';
import 'package:store/core/utils/constants/sizes.dart';

class AppAccountSection extends StatelessWidget {
  const AppAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServicesController());
    return Column(
      children: [
        const HeadingSection(
          title: 'App Settings',
          showActionButton: false,
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems,
        ),
        SettingsMenuTile(
          icon: Icons.brightness_4_outlined,
          title: 'Dark Mode',
          subTitle: 'Switch between light and dark mode',
          onTap: () {},
          trailing: Switch(value: true, onChanged: (value) {}),
        ),
      ],
    );
  }
}
