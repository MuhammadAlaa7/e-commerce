import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/texts/section_heading.dart';
import 'package:store/features/personalization/controllers/address_controller.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/features/shop/screens/checkout/widgets/address_information.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // * heading
        HeadingSection(
          buttonTitle: 'Change',
          title: 'Shipping Address',
          onPressed: () {
            addressController.selectAddressBottomSheet(context);
          },
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems / 2,
        ),
        //* only show the data of the address selected if there is one already selected
        const AddressInformation()
      ],
    );
  }
}
