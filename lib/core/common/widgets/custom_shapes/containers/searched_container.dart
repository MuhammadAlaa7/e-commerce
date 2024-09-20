import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackgroundColor = true,
    this.showBorder = true,
    this.padding =
        const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
  });
  final String text;
  final IconData? icon;
  final bool showBackgroundColor, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final bool isDark = AppHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        padding: const EdgeInsets.all(AppSizes.md),
        width: AppHelperFunctions.screenWidth(),
        decoration: BoxDecoration(
          color: showBackgroundColor
              ? isDark
                  ? AppColors.dark
                  : AppColors.light
              : Colors.transparent,
          borderRadius: BorderRadius.circular(
            AppSizes.cardRadiusLg,
          ),
          border: showBorder ? Border.all(color: Colors.grey) : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.darkGrey,
            ),
            const SizedBox(
              width: AppSizes.spaceBetweenItems * 1.5,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
