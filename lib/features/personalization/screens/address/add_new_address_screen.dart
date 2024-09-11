import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/buttons/default_button.dart';
import 'package:store/common/widgets/input_field/input_field.dart';
import 'package:store/features/personalization/controllers/user/address_controller.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/validators/custom_validator.dart';

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
            CSizes.md,
          ),
          child: Form(
            key: addressController.addressKey,
            child: Column(
              children: [
                InputField(
                  label: 'Name',
                  prefixIcon: Iconsax.user,
                  controller: addressController.name,
                  validator: (value) => CValidator.validateEmptyText(
                    fieldName: 'Name',
                    value: value,
                  ),
                ),
                const SizedBox(
                  height: CSizes.spaceBetweenInputFields,
                ),
                InputField(
                  label: 'Phone Number',
                  prefixIcon: Iconsax.mobile,
                  controller: addressController.phoneNumber,
                  validator: (value) => CValidator.validatePhoneNumber(value),
                ),
                const SizedBox(
                  height: CSizes.spaceBetweenInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InputField(
                        label: 'Street',
                        prefixIcon: Iconsax.building_44,
                        controller: addressController.street,
                        validator: (value) => CValidator.validateEmptyText(
                          fieldName: 'Street',
                          value: value,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: CSizes.spaceBetweenInputFields,
                    ),
                    Expanded(
                      child: InputField(
                        label: 'Postal Code',
                        prefixIcon: Iconsax.code,
                        controller: addressController.postalCode,
                        validator: (value) => CValidator.validateEmptyText(
                          fieldName: 'Postal Code',
                          value: value,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: CSizes.spaceBetweenInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                        child: InputField(
                      label: 'City',
                      prefixIcon: Iconsax.buildings,
                      controller: addressController.city,
                      validator: (value) => CValidator.validateEmptyText(
                        fieldName: 'City',
                        value: value,
                      ),
                    )),
                    const SizedBox(
                      width: CSizes.spaceBetweenInputFields,
                    ),
                    Expanded(
                      child: InputField(
                        label: 'State',
                        prefixIcon: Iconsax.activity,
                        controller: addressController.state,
                        validator: (value) => CValidator.validateEmptyText(
                          fieldName: 'State',
                          value: value,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: CSizes.spaceBetweenInputFields,
                ),
                const SizedBox(
                  height: CSizes.spaceBetweenInputFields,
                ),
                InputField(
                  label: 'Country',
                  prefixIcon: Iconsax.global,
                  controller: addressController.country,
                  validator: (value) => CValidator.validateEmptyText(
                    fieldName: 'Country',
                    value: value,
                  ),
                ),
                const SizedBox(
                  height: CSizes.spaceBetweenItems,
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
