import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/buttons/default_button.dart';
import 'package:store/common/widgets/input_field/input_field.dart';
import 'package:store/utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Add New Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            CSizes.md,
          ),
          child: Column(
            children: [
              const InputField(label: 'Name', prefixIcon: Iconsax.user),
              const SizedBox(
                height: CSizes.spaceBetweenInputFields,
              ),
              const InputField(
                  label: 'Phone Number', prefixIcon: Iconsax.mobile),
              const SizedBox(
                height: CSizes.spaceBetweenInputFields,
              ),
              const Row(
                children: [
                  Expanded(
                      child: InputField(
                          label: 'Street', prefixIcon: Iconsax.building_44)),
                  SizedBox(
                    width: CSizes.spaceBetweenInputFields,
                  ),
                  Expanded(
                      child: InputField(
                          label: 'Postal Code', prefixIcon: Iconsax.code)),
                ],
              ),
              const SizedBox(
                height: CSizes.spaceBetweenInputFields,
              ),
              const Row(
                children: [
                  Expanded(
                      child: InputField(
                          label: 'City', prefixIcon: Iconsax.buildings)),
                  SizedBox(
                    width: CSizes.spaceBetweenInputFields,
                  ),
                  Expanded(
                      child: InputField(
                          label: 'State', prefixIcon: Iconsax.activity)),
                ],
              ),
              const SizedBox(
                height: CSizes.spaceBetweenInputFields,
              ),
              const SizedBox(
                height: CSizes.spaceBetweenInputFields,
              ),
              const InputField(label: 'Country', prefixIcon: Iconsax.global),
              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              DefaultButton(label: 'Save', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
