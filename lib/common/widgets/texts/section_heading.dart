import 'package:flutter/material.dart';

class HeadingSection extends StatelessWidget {
  const HeadingSection({
    super.key,
    required this.title,
    this.buttonTitle = 'View All',
    this.showActionButton = true,
    this.textColor,
    this.onPressed,
  });

  final String title;

  final String buttonTitle;
  final bool showActionButton;
  final Color? textColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(
                color: textColor,
              ),
        ),
        if (showActionButton == true)
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonTitle,
            ),
          ),
      ],
    );
  }
}
