import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/features/personalization/screens/address/widgets/addresses_body.dart';


class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Addresses'),
        showBackArrow: true,
      ),
      body: const AddressesBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: () {
          Get.toNamed(AppRoutes.newAddress);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
