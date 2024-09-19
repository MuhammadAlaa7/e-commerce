import 'package:flutter/material.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/utils/constants22/colors.dart';
import 'package:store/utils/constants22/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

import '../../buttons/default_button.dart';

class ProductCoupon extends StatelessWidget {
  const ProductCoupon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunctions.isDarkMode(context);
    return RoundedContainer(
      backgroundColor: isDark ? CColors.dark : CColors.light,
      padding: const EdgeInsets.only(
        left: CSizes.md,
        right: CSizes.sm,
        top: CSizes.sm,
        bottom: CSizes.sm,
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
