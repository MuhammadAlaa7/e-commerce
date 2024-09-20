import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/features/personalization/controllers/user/address_controller.dart';
import 'package:store/features/personalization/models/address_model.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/formatter/formatter.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key,
    required this.address,
  });

  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    final addressController = AddressController.instance;
    return Obx(() {
      // the id of the selected address [ the placeholder that holds the current selected address by the user ]
      final currentSelectedAddressId =
          addressController.currentSelectedAddress.value.id;
      // the address of that single address widget will be treated as selected if it has the same id as the selected address
      final bool isAddressSelected = currentSelectedAddressId == address.id;
      return InkWell(
        onLongPress: () =>
            addressController.deleteAddressWarningPopup(address.id),
        onTap: () => addressController.onSelectAddress(address),
        borderRadius: BorderRadius.circular(AppSizes.md),
        child: RoundedContainer(
          showBorder: isAddressSelected ? false : true,
          borderColor: isDark ? AppColors.darkerGrey : AppColors.lightGrey,
          padding: const EdgeInsets.all(AppSizes.md),
          // margin: const EdgeInsets.only(bottom: CSizes.spaceBetweenItems),
          backgroundColor: isAddressSelected
              ? AppColors.primary.withOpacity(0.4)
              : Colors.transparent,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: AppSizes.sm / 2,
                  ),
                  Text(
                    AppFormatter.formatPhoneNumber(
                      address.phoneNumber,
                    ),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: AppSizes.sm / 2,
                  ),
                  Text(
                    // it is a string extension to represent the full address
                    address.toString(),
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  isAddressSelected ? Iconsax.tick_circle5 : null,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
