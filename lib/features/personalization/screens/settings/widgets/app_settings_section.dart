import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/data/services/services_controller.dart';
import 'package:store/dummy_data.dart';
import 'package:store/features/personalization/screens/settings/widgets/settings_menu_tile.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

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
          height: CSizes.spaceBetweenItems,
        ),
        SettingsMenuTile(
          icon: Iconsax.document_upload,
          title: 'Load Data',
          subTitle: 'Upload data to you Cloud Storage',
          onTap: () {
            //   controller.uploadImagesToFireStore();
            // DummyData.uploadDummyData();
            //  controller.uploadListBannersToFireStore();
         //   controller.uploadBannerWithImages();
            // controller.uploadCategoriesWithImages();
            // controller.uploadBrandsWithImages();
            // controller.uploadBrandCategory();
            // controller.uploadProductCategory();
            // controller.uploadProductsWithTheirImages();
            // controller.updateProductsFields();
           // controller.deleteField();

          },
        ),
        SettingsMenuTile(
          icon: Iconsax.location,
          title: 'Location',
          subTitle: 'Set recommendation based on location',
          onTap: () {},
          trailing: Switch(value: true, onChanged: (value) {}),
        ),
        SettingsMenuTile(
          icon: Iconsax.security_user,
          title: 'Safe Mode',
          subTitle: 'Search result is safe for all ages',
          onTap: () {},
          trailing: Switch(value: false, onChanged: (value) {}),
        ),
        SettingsMenuTile(
          icon: Iconsax.image,
          title: 'HD image quality',
          subTitle: 'Set image quality to be seen',
          onTap: () {},
          trailing: Switch(value: false, onChanged: (value) {}),
        ),
      ],
    );
  }
}
