import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/buttons/default_button.dart';
import 'package:store/core/common/widgets/buttons/outlined_button.dart';
import 'package:store/core/common/widgets/texts/section_heading.dart';
import 'package:store/core/utils/popups/loaders.dart';
import 'package:store/features/personalization/screens/address/add_new_address_screen.dart';
import 'package:store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/cloud_helper_functions.dart';
import 'package:store/core/utils/helper/network_manager.dart';
import 'package:store/core/utils/popups/full_screen_loader.dart';
import 'package:store/core/utils/popups/toasts.dart';

import '../../../../data/repos/address_repo.dart';
import '../../models/address_model.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  @override
  void onInit() {
    fetchAllUserAddresses();
    super.onInit();
  }

  final addressRepo = Get.put(AddressRepository());
  // selected address
  Rx<AddressModel> currentSelectedAddress = AddressModel.empty().obs;

//fields of the add new address screen
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final postalCode = TextEditingController();
  final country = TextEditingController();
  final addressKey = GlobalKey<FormState>();

// refresh variable to redraw the design of the screen
  RxBool refreshData = true.obs;

  //*****************         fetch user addresses        *****************

  Future<List<AddressModel>> fetchAllUserAddresses() async {
    try {
      final addresses = await addressRepo.getUserAddresses();
      // after getting hte addresses, check  which address is selected from them
      // return from address the first one that has selected property set to true
      currentSelectedAddress.value = addresses.firstWhere(
        (address) => address.isSelected == true,
        orElse: () => AddressModel.empty(),
      );
         

// return all address [ selected or not ]
      return addresses;
    } catch (e) {
      // handing the error for the user to see
      AppToasts.errorSnackBar(
          title: 'Error', message: 'Cannot fetch your addresses');
      return [];
    }
  }

//! ********************************* Add New Address *********************************

  Future<void> addNewAddress() async {
    try {
      // start loader
      FullScreenLoader.openLoadingDialog(
        'Adding new address ...',
        AppImages.docerAnimation,
      );

      // check for internet connection
      final isConnected = await NetworkManager.instance.isConnected();

      // if not connected
      if (!isConnected) {
        FullScreenLoader.closeLoadingDialog();
        AppToasts.errorSnackBar(
          title: 'Error',
          message: 'No internet connection',
        );
        return;
      }

      // validate form
      // if not validation
      if (!addressKey.currentState!.validate()) {
        FullScreenLoader.closeLoadingDialog();
        return;
      }

//        prepare the address that will be saved in the database from the user input fields
// make an address model from the user inputs data , to be sent to the database
// its id will be empty because it will be added to the database ,and will take the id from the database after saving it there
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        isSelected: true, // new address is selected by default
      );
      // send the address to the database and return the address id
      final addressId = await addressRepo.addNewAddress(address);
      // update the address id
      address.id = addressId;
      // put the new address in the current selected address
      currentSelectedAddress(address);

      // stop the loader
      FullScreenLoader.closeLoadingDialog();
      // show success message
      AppToasts.successSnackBar(
        title: 'Success',
        message: 'Address added successfully',
      );
      // refresh the address data to show the new address in the address screen when popping to it
      refreshData
          .toggle(); // toggle is a function for bool variables to switch to true or false

// reset fields to be ready for new address input
      resetFormFields();

// close the add new screen and return to the addresses screen
      Navigator.pop(Get.context!);
    } catch (e) {
      // stop the loader
      log(e.toString());
      FullScreenLoader.closeLoadingDialog();
      // show error message
      AppToasts.errorSnackBar(
        title: 'Address not found!',
        message: e.toString(),
      );
    }
  }

  // reset all the input filed of the add new address screen
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    city.clear();
    state.clear();
    postalCode.clear();
    country.clear();
    addressKey.currentState?.reset(); // reset the form key
  }

// select address
  /// selects the address that was selected by the user
  Future<void> onSelectAddress(AddressModel newSelectedAddress) async {
    try {
      // start loader
      AppLoaders.loadingOverLayDialog();
      // check first if it is already selected
      if (currentSelectedAddress.value.id != newSelectedAddress.id) {
        // start loader while clearing the old selected address from the database and assigning the new one

        // first, check if the current selected address is not empty to not update null or empty address
        // if it is not empty , clear it >>>
        // how the clear is done ? >>> tke the id of the current selected address and send it to the update method to send it to the database
        if (currentSelectedAddress.value.id.isNotEmpty) {
          // change  the isSelected field value of the current selected address [ the old selected address ] in the database first
          await addressRepo.updateIsSelectedField(
            currentSelectedAddress.value.id,
            false,
          );
        }
        // the new selected address is coming throw the listview index
        // assign the [isSelected] field of the new selected address to true
        newSelectedAddress.isSelected = true;
        // put the new selected address in the current selected address [ place holder]

        currentSelectedAddress(newSelectedAddress);

        // make the value of [isSelected] field of the new selected address to true in the database

        await addressRepo.updateIsSelectedField(newSelectedAddress.id, true);

        // stop the loader
        Get.back();
      }
    } catch (e) {
      AppToasts.errorSnackBar(
          title: 'Error in Selection ',
          message: 'Couldn\'t select the address ');
      Get.back();
    }
  }

  void deleteAddressWarningPopup(String addressId) {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(AppSizes.md),
      title: 'Delete Address',
      middleText:
          'Are you sure you want to delete your address permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: DefaultButton(
        width: 120,
        label: 'Delete',
        onPressed: () async {
          Get.back();
          deleteAddress(addressId);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
      ),
      //confirmTextColor: Colors.white,
      cancel: CustomOutlinedButton(
        width: 120,
        label: 'Cancel',
        onPressed: () => Get.back(),
      ),
    );
  }

// delete address with warning popup
  Future<void> deleteAddress(String addressId) async {
    try {
      // start loader until it is deleted from database
      Get.defaultDialog(
        title: '',
        content: const CircularProgressIndicator(
          color: AppColors.primary,
        ),

        // prevents the user from popping the dialog when they press the back button
        // this is done to prevent the user from interrupting the process of selecting a new address
        onWillPop: () async {
          return false;
        },

        barrierDismissible: false,
        backgroundColor: Colors.transparent,
      );
      await addressRepo.deleteAddress(addressId);

      Get.back();

      // update the ui after deleting the address
      refreshData.toggle();

      AppToasts.customToast(message: 'Address has been deleted successfully');
    } catch (e) {
      AppToasts.errorSnackBar(
          title: 'Error', message: 'something wrong wrong ');
    }
  }

  // show bottom sheet for changing the address in checkout screen
  Future<dynamic> selectAddressPopup(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(AppSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadingSection(
                    title: 'Select address ',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBetweenItems,
                  ),
                  FutureBuilder(
                      future: fetchAllUserAddresses(),
                      builder: (context, snapshot) {
                        final widget =
                            CustomCloudHelperFunctions.checkMultiRecordState(
                                snapshot: snapshot,
                                nothingFound: const Text('No addresses found'));
                        if (widget != null) return widget;
                        final addresses = snapshot.data!;

                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            return SingleAddress(address: addresses[index]);
                          },
                          itemCount: addresses.length,
                        );
                      }),
                  const SizedBox(
                    height: AppSizes.spaceBetweenItems,
                  ),
                  DefaultButton(
                    width: double.infinity,
                    label: 'Add new address',
                    onPressed: () {
                      Get.to(() => const AddNewAddressScreen());
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  /// update selected address , by clearing the old and then assigning the new one to avoid the conflict with the old one
  ///
  /// This function clears the field of selectedAddress of the current selected address from the firebase database
  /// We update the field of the old selected address to false in the database because it is the reference
  /// Then it makes the field of selectedAddress of the new selected address >> true
  /// Then it puts the new selected address in the place holder [currentSelectedAddress] after assigning its field
  /// finally, it uploads the new selected address in the remote database [updating it ]
  // Future<void> updateSelectedAddress(AddressModel address) async {
  //   try {
  //     // clear the [ selected ] field of the current selected address model
  //     // make the old address that in the place holder current selected address not selected [ selectedAddress = false ]
  //     await addressRepo.updateIsSelectedField(
  //       address.id,
  //       false,
  //     );
  //     // assign selected address
  //     address.isSelected = true;
  //     currentSelectedAddress.value = address;
  //     // update the selected address in the database [ remote ]
  //     await addressRepo.updateIsSelectedField(
  //       // the current selected address now holds the new selected address ,
  //       // and we want to update it in the remote database as well as local controller
  //       currentSelectedAddress.value.id, true,
  //     );
  //   } catch (e) {
  //     CLoaders.errorSnackBar(
  //         title: 'Error in selection', message: e.toString());
  //   }
  // }
}
