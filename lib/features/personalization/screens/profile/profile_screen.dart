import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/buttons/text_button.dart';
import 'package:store/common/widgets/images/circular_image.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title:
            Text('Profile', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.md),
          child: Column(
            children: [
              // * User picture

              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const CircularImage(
                        image: CImages.userProfile, width: 80, height: 80),
                    CustomTextButton(
                      label: 'Change Profile Picture',
                      onPressed: () {},
                    )
                  ],
                ),
              ),

              // * User details
              const SizedBox(
                height: CSizes.spaceBetweenSections / 2,
              ),
              const Divider(),
              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              const HeadingSection(
                  title: 'Profile Information', showActionButton: false),
              ProfileMenu(title: 'Name', value: 'Muhammad Alaa', onTap: () {}),
              ProfileMenu(title: 'Username', value: 'moalaa88', onTap: () {}),
              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              const Divider(),
              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              const HeadingSection(
                  title: 'Personal Information', showActionButton: false),
              ProfileMenu(
                title: 'User Id',
                value: '88342',
                onTap: () {},
                icon: Iconsax.copy,
              ),
              ProfileMenu(
                  title: 'Email', value: 'alaaklug@gmail.com', onTap: () {}),
              ProfileMenu(
                  title: 'Phone Number', value: '+201025064745', onTap: () {}),
              ProfileMenu(title: 'Gender', value: 'Male', onTap: () {}),
              ProfileMenu(
                  title: 'Date of Birth', value: 'Jul 25 1998', onTap: () {}),
              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              const Divider(),
              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              CustomTextButton(
                  label: 'Delete Account', onPressed: () {}, color: Colors.red),
              const SizedBox(
                height: CSizes.spaceBetweenSections * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
