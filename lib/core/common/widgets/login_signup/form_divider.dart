import 'package:flutter/material.dart';
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
        const Expanded(
          child: Divider(
            // color: isDark ? AppColors.darkGrey : AppColors.lightGrey,
            //   thickness: 1.5,
            indent: 60,
            endIndent: 10,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Expanded(
          child: Divider(
            //   color: isDark ? AppColors.darkGrey : AppColors.lightGrey,
            //  thickness: 0.5,
            indent: 10,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
