import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/core/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/core/common/widgets/buttons/default_button.dart';
import 'package:store/core/common/widgets/input_field/input_field.dart';
import 'package:store/features/personalization/controllers/user/address_controller.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/validators/custom_validator.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Add New Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            AppSizes.md,
          ),
          child: Form(
            key: addressController.addressKey,
            child: Column(
              children: [
                InputField(
                  label: 'Name',
                  prefixIcon: Iconsax.user,
                  controller: addressController.name,
                  validator: (value) => AppValidator.validateEmptyText(
                    fieldName: 'Name',
                    value: value,
                  ),
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenInputFields,
                ),
                InputField(
                  label: 'Phone Number',
                  prefixIcon: Iconsax.mobile,
                  controller: addressController.phoneNumber,
                  validator: (value) => AppValidator.validatePhoneNumber(value),
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InputField(
                        label: 'Street',
                        prefixIcon: Iconsax.building_44,
                        controller: addressController.street,
                        validator: (value) => AppValidator.validateEmptyText(
                          fieldName: 'Street',
                          value: value,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: AppSizes.spaceBetweenInputFields,
                    ),
                    Expanded(
                      child: InputField(
                        label: 'Postal Code',
                        prefixIcon: Iconsax.code,
                        controller: addressController.postalCode,
                        validator: (value) => AppValidator.validateEmptyText(
                          fieldName: 'Postal Code',
                          value: value,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                        child: InputField(
                      label: 'City',
                      prefixIcon: Iconsax.buildings,
                      controller: addressController.city,
                      validator: (value) => AppValidator.validateEmptyText(
                        fieldName: 'City',
                        value: value,
                      ),
                    )),
                    const SizedBox(
                      width: AppSizes.spaceBetweenInputFields,
                    ),
                    Expanded(
                      child: InputField(
                        label: 'State',
                        prefixIcon: Iconsax.activity,
                        controller: addressController.state,
                        validator: (value) => AppValidator.validateEmptyText(
                          fieldName: 'State',
                          value: value,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenInputFields,
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenInputFields,
                ),
                InputField(
                  label: 'Country',
                  prefixIcon: Iconsax.global,
                  controller: addressController.country,
                  validator: (value) => AppValidator.validateEmptyText(
                    fieldName: 'Country',
                    value: value,
                  ),
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenItems,
                ),
                DefaultButton(
                  label: 'Save',
                  onPressed: () async {
                    //TODO: Call add new function here from controller
                    await addressController.addNewAddress();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
