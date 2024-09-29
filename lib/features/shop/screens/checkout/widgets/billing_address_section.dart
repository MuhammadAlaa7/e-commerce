
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/texts/section_heading.dart';
import 'package:store/features/personalization/controllers/address_controller.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/features/personalization/models/address_model.dart';

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
            addressController.selectAddressPopup(context);
          },
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems / 2,
        ),
        //* only show the data of the address selected if there is one already selected
        addressController.currentSelectedAddress.value != AddressModel.empty()
            ? Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      addressController.currentSelectedAddress.value.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBetweenItems / 2,
                    ),
                    Row(children: [
                      const Icon(Icons.phone, color: Colors.grey, size: 16),
                      const SizedBox(
                        width: AppSizes.spaceBetweenItems,
                      ),
                      Text(
                        addressController
                            .currentSelectedAddress.value.phoneNumber,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ]),
                    const SizedBox(
                      height: AppSizes.spaceBetweenItems / 2,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_history,
                            color: Colors.grey, size: 16),
                        const SizedBox(
                          width: AppSizes.spaceBetweenItems,
                        ),
                        Expanded(
                          // * make it expanded to prevent the overflow for the text
                          child: Text(
                            addressController.currentSelectedAddress.value
                                .toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : const Text('select an address'),
      ],
    );
  }
}
