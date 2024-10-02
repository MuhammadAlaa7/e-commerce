import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/core/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:store/core/common/widgets/products/sortable_products/sortable_products.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/features/shop/controllers/product/all_products_controller.dart';
import 'package:store/core/utils/constants/sizes.dart';

import '../../models/product_model.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.md),
          child: FutureBuilder(
            // the data will come in the future and passed to snapshot
            // it updates the UI with the new data by its own no need for Obx
            future: futureMethod ?? controller.fetchProductByQuery(query),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primary,
                ));
              }

              if (snapshot.hasError) {
                return const Center(child: Text('Error in Fetching Products'));
              }

              if (snapshot.data == null || snapshot.data!.isEmpty) {
                return const Center(child: Text('No Products Found'));
              }

              final products = snapshot.data!;

              return SortableProducts(
                products: products,
              );
            },
          ),
        ),
      ),
    );
  }
}
