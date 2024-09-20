import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/auth/controllers/login/login_controller.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //  padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            //  color: Colors.white,
            border: Border.all(color: AppColors.lightGrey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            //!  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            onPressed: () {
              controller.googleSignIn();
            },
            icon: const Image(
              height: AppSizes.iconLg,
              width: AppSizes.iconLg,
              image: AssetImage(AppImages.google),
            ),
          ),
        ),
        const SizedBox(
          width: AppSizes.spaceBetweenItems,
        ),
        Container(
          //  padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            //  color: Colors.white,
            border: Border.all(color: AppColors.lightGrey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              height: AppSizes.iconLg,
              width: AppSizes.iconLg,
              image: AssetImage(AppImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
