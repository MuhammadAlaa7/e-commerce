import 'package:flutter/material.dart';
import 'package:store/common/styles/text_styles.dart';
import 'package:store/utils/constants22/image_strings.dart';
import 'package:store/utils/constants22/sizes.dart';
import 'package:store/utils/constants22/text_strings.dart';
import 'package:store/utils/helper/helper_functions.dart';

class LoginScreenHeader extends StatelessWidget {
  const LoginScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = CHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //*  logo
        Image(
          height: 150,
          image: AssetImage(
            isDark ? CImages.lightAppLogo : CImages.darkAppLogo,
          ),
        ),
        // * title 
        Text(
          CTexts.loginTitle,
          style: CTextStyles.titleTextStyle(context),
        ),
        const SizedBox(
          height: CSizes.sm,
        ),
        // * sub title
        Text(
          CTexts.loginSubTitle,
          style: CTextStyles.subTitleTextStyle(context),
        )
      ],
    );
  }
}
