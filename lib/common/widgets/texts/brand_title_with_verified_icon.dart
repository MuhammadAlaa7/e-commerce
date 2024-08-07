import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/texts/product_title.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';

class BrandTitleWithVerifiedIcon extends StatelessWidget {
  const BrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.iconColor = CColors.primary,
    this.textSize = TextSizes.small,
  });
  final String title;
  final Color iconColor;
  final TextSizes textSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ProductTitleText(
            title: title,
            textSize: textSize,
          ),
        ),
        const SizedBox(width: CSizes.xs),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: CSizes.iconXs,
        ),
      ],
    );
  }
}
