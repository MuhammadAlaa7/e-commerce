import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/colors.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
    this.enableOnTap = true,
  });

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool enableOnTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: trailing,
      onTap: enableOnTap ? onTap : null,
    );
  }
}
