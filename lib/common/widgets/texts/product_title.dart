import 'package:flutter/material.dart';
import 'package:store/utils/constants/enums.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    required this.title,
    this.textSize = TextSizes.small,
    this.textColor,
  });

  final String title;
  final TextSizes textSize;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: textSize == TextSizes.small
            ? Theme.of(context).textTheme.labelLarge!.apply(color: textColor)
            : textSize == TextSizes.medium
                ? Theme.of(context).textTheme.bodyLarge!.apply(color: textColor)
                : textSize == TextSizes.large
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
