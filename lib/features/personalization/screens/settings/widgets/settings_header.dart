import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/custom_shapes/primary_header_container.dart';
import 'package:store/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:store/common/widgets/loaders/shimmer_effect.dart';
import 'package:store/features/personalization/screens/profile/profile_screen.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

import '../../../controllers/user/user_controller.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    return PrimaryHeaderContainer(
      child: Column(
        children: [
          // * App Bar

          CustomAppBar(
            title: Text(
              'Account',
              style: Theme.of(context).textTheme.headlineMedium!.apply(
                    color: Colors.white,
                  ),
            ),
          ),

          // * user profile card
          Obx(() {
            return userController.profileLoading.value
                ? const CustomShimmerEffect(
                    height: 20,
                    width: 200,
                    radius: 30,
                  )
                : UserProfileTile(
                    image: userController.user.value.profilePicture.isNotEmpty
                        ? userController.user.value.profilePicture
                        : CImages.userProfileImage1,
                    title: userController.user.value.fullName,
                    subTitle: userController.user.value.email,
                    onPressed: () {
                      CHelperFunctions.goTo(context, const ProfileScreen());
                    },
                  );
          }),

          const SizedBox(
            height: CSizes.spaceBetweenSections,
          )
        ],
      ),
    );
  }
}
