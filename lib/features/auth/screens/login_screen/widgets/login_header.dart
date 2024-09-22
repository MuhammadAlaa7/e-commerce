import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/constants/text_strings.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = AppHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //*  logo
        Image(
          height: 150,
          image: AssetImage(
            isDark ? AppImages.lightAppLogo : AppImages.darkAppLogo,
          ),
        ),
        // * title
        Text(
          AppTexts.loginTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: AppSizes.sm,
        ),
        // * sub title
        Text(
          AppTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
