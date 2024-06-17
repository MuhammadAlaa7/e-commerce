import 'package:flutter/material.dart';
import 'package:store/common/styles/text_styles.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/constants/text_strings.dart';
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
            isDark ? CImages.whiteAppLogo : CImages.blackAppLogo,
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
