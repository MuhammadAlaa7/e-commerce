import 'package:flutter/material.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/custom_shapes/primary_header_container.dart';
import 'package:store/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:store/features/personalization/screens/profile/profile_screen.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
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
          UserProfileTile(
            onPressed: () {
              CHelperFunctions.goTo(context, const ProfileScreen());
            },
          ),

          const SizedBox(
            height: CSizes.spaceBetweenSections,
          )
        ],
      ),
    );
  }
}
