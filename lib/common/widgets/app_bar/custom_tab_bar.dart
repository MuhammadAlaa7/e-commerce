import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/helper/helper_functions.dart';

class CustomTapBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTapBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunctions.isDarkMode(context);
    return Material(
      color: isDark ? CColors.dark : CColors.light,
      // shadowColor: isDark ? Colors.green : Colors.green,
      elevation: 2,

      child: TabBar(
        tabs: tabs,
        indicatorColor: CColors.primary,
        unselectedLabelColor: CColors.darkGrey,
        isScrollable: true,
        labelColor: isDark ? Colors.white : Colors.black,
        tabAlignment: TabAlignment.start,
        dividerColor: isDark ? CColors.darkGrey : Colors.grey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
