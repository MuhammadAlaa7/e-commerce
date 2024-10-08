import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:store/core/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/features/personalization/controllers/address_controller.dart';
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
      final currentSelectedAddressId =
          addressController.currentSelectedAddress.value.id;
      final bool isAddressSelected = currentSelectedAddressId == address.id;

      return Dismissible(
        key: Key(address.id),
        direction: DismissDirection.endToStart,
        onDismissed: (_) =>
            addressController.deleteAddressWarningPopup(address.id),
        background: Container(
          color: Colors.red,
        ),
        child: InkWell(
          onTap: () => addressController.onSelectAddress(address),
          borderRadius: BorderRadius.circular(AppSizes.md),
          child: RoundedContainer(
            showBorder: !isAddressSelected,
            borderColor: isDark ? AppColors.darkerGrey : AppColors.lightGrey,
            padding: const EdgeInsets.all(AppSizes.md),
            backgroundColor: isAddressSelected
                ? AppColors.primary.withOpacity(0.4)
                : Colors.transparent,
            child: Stack(
              children: [
                _buildAddressDetails(context),
                _buildSelectionIcon(isAddressSelected, isDark),
                //  _buildDeletionIcon(),
              ],
            ),
          ),
        ),
      );
    });
  }

// * address details
  Column _buildAddressDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          address.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: AppSizes.sm / 2),
        Text(
          AppFormatter.formatPhoneNumber(address.phoneNumber),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: AppSizes.sm / 2),
        Text(
          address.toString(),
          softWrap: true,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

// * selection icon
  Positioned _buildSelectionIcon(bool isAddressSelected, bool isDark) {
    return Positioned(
      right: 5,
      top: 0,
      child: Icon(
        isAddressSelected ? Iconsax.tick_circle5 : null,
        color: isDark ? Colors.white : Colors.black,
      ),
    );
  }

  Positioned _buildDeletionIcon() {
    return const Positioned(
      right: 30,
      top: 0,
      child: Icon(
        Iconsax.trash,
        color: Colors.red,
      ),
    );
  }
}
