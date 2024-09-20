import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';

class SaleContainer extends StatelessWidget {
  const SaleContainer({
    super.key,
    required this.sale,
  });

  final String? sale;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      backgroundColor: AppColors.secondary.withOpacity(0.8),
      radius: AppSizes.sm,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.sm, vertical: AppSizes.xs),
      child: Text(
        '$sale%',
        style: Theme.of(context).textTheme.labelLarge!.apply(
              color: Colors.black,
            ),
      ),
    );
  }
}
