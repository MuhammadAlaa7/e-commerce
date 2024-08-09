import 'package:flutter/material.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

class SaleContainer extends StatelessWidget {
  const SaleContainer({
    super.key,
    required this.sale,
  });

  final String? sale;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      backgroundColor: CColors.secondary.withOpacity(0.8),
      radius: CSizes.sm,
      padding: const EdgeInsets.symmetric(
          horizontal: CSizes.sm, vertical: CSizes.xs),
      child: Text(
        '$sale%',
        style: Theme.of(context).textTheme.labelLarge!.apply(
              color: Colors.black,
            ),
      ),
    );
  }
}
