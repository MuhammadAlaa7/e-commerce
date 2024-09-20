import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

import '../../buttons/default_button.dart';

class ProductCoupon extends StatelessWidget {
  const ProductCoupon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    return RoundedContainer(
      backgroundColor: isDark ? AppColors.dark : AppColors.light,
      padding: const EdgeInsets.only(
        left: AppSizes.md,
        right: AppSizes.sm,
        top: AppSizes.sm,
        bottom: AppSizes.sm,
      ),
      showBorder: true,
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintMaxLines: 2,
                hintText: 'Have a promo code ? Enter it here',
                hintStyle: Theme.of(context).textTheme.labelLarge,
                errorBorder: InputBorder.none,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: DefaultButton(
              label: 'Apply',
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: isDark
                    ? Colors.white.withOpacity(0.5)
                    : Colors.black.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
