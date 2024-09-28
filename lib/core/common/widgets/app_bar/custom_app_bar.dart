import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/sizes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // because the app bar in the scaffold is preferred sized widget
  const CustomAppBar({
    super.key,
    this.showBackArrow = true,
    this.title,
    this.actions,
    this.leading,
  });

  final bool showBackArrow;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding 16
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
      child: AppBar(
        automaticallyImplyLeading: showBackArrow,
        leading: showBackArrow ? null : leading,
        title: title,
        actions: actions,
      ),
    );
  }

  //  * -- this is the height of the app bar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
