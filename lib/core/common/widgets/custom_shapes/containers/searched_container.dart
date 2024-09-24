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
    this.margin = const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
  });
  final String text;
  final IconData? icon;
  final bool showBackgroundColor, showBorder;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    final bool isDark = AppHelperFunctions.isDarkMode(context);
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(AppSizes.sm),
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
        const  SizedBox(
            width: 5,
          ),
          Icon(
            icon,
            color: AppColors.darkGrey,
          ),
          const SizedBox(
            width: AppSizes.spaceBetweenItems * 1.5,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                contentPadding: const EdgeInsets.all(0),
                hintText: text,
                hintStyle: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

  // Text(
          //   text,
          //   style: Theme.of(context).textTheme.bodySmall,
          // ),