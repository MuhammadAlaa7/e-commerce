import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/core/common/widgets/buttons/default_button.dart';
import 'package:store/core/common/widgets/input_field/input_field.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/validators/custom_validator.dart';

import '../../../../../core/common/widgets/app_bar/custom_app_bar.dart';
import '../../../controllers/update_name_controller.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final updateNameController = Get.put(UpdateNameController());
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Change Name',
            style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true, // <-- SEE HERE
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            Text(
              'use a real name for easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: AppSizes.spaceBetweenSections),
            Form(
              key: updateNameController.updateNameFormKey,
              child: Column(
                children: [
                  InputField(
                    validator: (value) => AppValidator.validateEmptyText(
                        fieldName: 'First Name', value: value),
                    controller: updateNameController.firstName,
                    label: 'First Name',
                    prefixIcon: Iconsax.user,
                  ),
                  const SizedBox(height: AppSizes.spaceBetweenInputFields),
                  InputField(
                    validator: (value) => AppValidator.validateEmptyText(
                        fieldName: 'Last Name', value: value),
                    controller: updateNameController.lastName,
                    label: 'Last Name',
                    prefixIcon: Iconsax.user,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spaceBetweenSections),
            DefaultButton(
                label: 'Save',
                onPressed: () {
                  updateNameController.updateName();
                })
          ],
        ),
      ),
    );
  }
}
