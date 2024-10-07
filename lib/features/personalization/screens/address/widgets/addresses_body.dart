
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/loaders/animated_loader.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/cloud_helper_functions.dart';
import 'package:store/features/personalization/controllers/address_controller.dart';
import 'package:store/features/personalization/screens/address/widgets/single_address.dart';


class AddressesBody extends StatelessWidget {
  const AddressesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        // * the obx is watching the refreshData variable [ observable]
        // * if it changes then it will call the FutureBuilder
        // ! we refresh data after saving the new address , so that the address be shown in the address screen directly
        // * and the future builder will call the future method in it and give the snapshot to the builder with new data
        //  * to reload data after popping the add new address screen
        child: Obx(
          () => FutureBuilder(
              // to redraw the design when the data changes in the future
              key: Key(addressController.refreshData.value.toString()),
              future: addressController.fetchAllUserAddresses(),
              builder: (context, snapshot) {
                final emptyWidget = AnimationLoaderWidget(
                  text: 'There is no address yet\n Please add one',
                  animationImage: AppImages.emptyAnimation,
                );
                final widget = CustomCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                  nothingFound: emptyWidget,
                );
                if (widget != null) return widget;

                // data found
                final addresses = snapshot.data!;
                return ListView.separated(
                  separatorBuilder: (_, index) => const SizedBox(
                    height: AppSizes.spaceBetweenItems,
                  ),
                  itemCount: addresses.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) => SingleAddress(
                    address: addresses[index],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
