import 'package:flutter/material.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/features/personalization/screens/address/add_new_address_screen.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';
import 'widgets/single_address.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Addresses'),
        showBackArrow: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CColors.primary,
        foregroundColor: Colors.white,
        onPressed: () {
          CHelperFunctions.navigateToScreen(context, const AddNewAddressScreen());
        },
        child: const Icon(Icons.add),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CSizes.md),
          child: Column(
            children: [
              SingleAddress(
                isSelected: true,
              ),
              SingleAddress(
                isSelected: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
