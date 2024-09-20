import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final bool isDark = AppHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        Expanded(
          child: Divider(
            color: isDark ? AppColors.darkGrey : AppColors.lightGrey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Expanded(
          child: Divider(
            color: isDark ? AppColors.darkGrey : AppColors.lightGrey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
