import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CSizes.sm),
      decoration: const BoxDecoration(
        color: CColors.dark,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(CSizes.cardRadiusMd),
          bottomRight: Radius.circular(CSizes.cardRadiusMd),
        ),
      ),
      child: const Icon(
        Icons.add,
        color: CColors.light,
      ),
    );
  }
}
