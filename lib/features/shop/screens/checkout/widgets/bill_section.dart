import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

import 'billing_address_section.dart';
import 'billing_amount_section.dart';
import 'billing_payment_section.dart';

class BillSection extends StatelessWidget {
  const BillSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      backgroundColor: AppHelperFunctions.isDarkMode(context)
          ? AppColors.dark
          : AppColors.light,
      padding: const EdgeInsets.all(AppSizes.md),
      child: const Column(
        children: [
          //* pricing
          BillingAmountSection(),
          // * divider
          Divider(
            color: Colors.grey,
          ),

          SizedBox(
            height: AppSizes.spaceBetweenItems,
          ),
          // * payment method
          BillingPaymentSection(),
          // * Address
          SizedBox(
            height: AppSizes.spaceBetweenItems,
          ),
          BillingAddressSection(),
        ],
      ),
    );
  }
}
