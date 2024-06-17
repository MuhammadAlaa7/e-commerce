import 'package:flutter/material.dart';
import 'package:store/common/widgets/icons/circular_icon.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class ProductQuantityWithAddRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          icon: Icons.remove,
          height: 32,
          width: 32,
          size: CSizes.md,
          iconColor: isDark ? Colors.white : Colors.black,
        ),
        const SizedBox(width: CSizes.sm),
        Text('2', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(width: CSizes.sm),
        const CircularIcon(
          icon: Icons.add,
          height: 32,
          width: 32,
          size: CSizes.md,
          backgroundColor: CColors.primary,
          iconColor: Colors.white,
        ),
      ],
    );
  }
}
