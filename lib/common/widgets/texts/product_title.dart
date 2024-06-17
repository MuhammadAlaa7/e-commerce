import 'package:flutter/material.dart';
import 'package:store/utils/constants/enums.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    required this.title,
    this.textSize = TextSize.small,
    this.textColor,
  });

  final String title;
  final TextSize textSize;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: textSize == TextSize.small
            ? Theme.of(context).textTheme.labelMedium!.apply(color: textColor)
            : textSize == TextSize.medium
                ? Theme.of(context).textTheme.bodyLarge!.apply(color: textColor)
                : textSize == TextSize.large
                    ? Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .apply(color: textColor)
                    : Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: textColor));
  }
}
