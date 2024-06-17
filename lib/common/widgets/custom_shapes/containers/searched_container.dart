import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackgroundColor = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
  });
  final String text;
  final IconData? icon;
  final bool showBackgroundColor, showBorder;
  final EdgeInsetsGeometry padding ;

  @override
  Widget build(BuildContext context) {
    final bool isDark = CHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding ,
      child: Container(
        padding: const EdgeInsets.all(CSizes.md),
        width: CHelperFunctions.screenWidth(context),
        decoration: BoxDecoration(
          color: showBackgroundColor
              ? isDark
                  ? CColors.dark
                  : CColors.light
              : Colors.transparent,
          borderRadius: BorderRadius.circular(
            CSizes.cardRadiusLg,
          ),
          border: showBorder ? Border.all(color: Colors.grey) : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: CColors.darkGrey,
            ),
            const SizedBox(
              width: CSizes.spaceBetweenItems * 1.5,
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
