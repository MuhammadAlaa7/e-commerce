import 'package:flutter/material.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/buttons/text_button.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/personalization/controllers/user/user_controller.dart';
import 'package:store/utils/constants/sizes.dart';
import 'widgets/personal_information.dart';
import 'widgets/profile_information.dart';
import 'widgets/user_picture.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
   // UserController.instance;
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

              const UserPictureSection(),

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
              const ProfileInformationSection(),
              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              const Divider(),
              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              const HeadingSection(
                  title: 'Personal Information', showActionButton: false),
              const PersonalInformationSection(),
              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              const Divider(),
              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              CustomTextButton(
                  label: 'Delete Account', onPressed: () {
                    UserController.instance.deleteAccountWarningPopup();
                  }, color: Colors.red),
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

