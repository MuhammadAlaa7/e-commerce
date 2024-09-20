import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class CustomTapBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTapBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    return Material(
      color: isDark ? AppColors.dark : AppColors.light,
      // shadowColor: isDark ? Colors.green : Colors.green,
      elevation: 2,

      child: TabBar(
        tabs: tabs,
        indicatorColor: AppColors.primary,
        unselectedLabelColor: AppColors.darkGrey,
        isScrollable: true,
        labelColor: isDark ? Colors.white : Colors.black,
        tabAlignment: TabAlignment.start,
        dividerColor: isDark ? AppColors.darkGrey : Colors.grey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
