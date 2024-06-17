import 'package:flutter/material.dart';
import 'package:store/common/styles/text_styles.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/helper/helper_functions.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final bool isDark = CHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        Expanded(
          child: Divider(
            color: isDark ? CColors.darkGrey : CColors.lightGrey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText,
          style: CTextStyles.subTitleTextStyle(context),
        ),
        Expanded(
          child: Divider(
            color: isDark ? CColors.darkGrey : CColors.lightGrey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
