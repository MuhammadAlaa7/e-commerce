import 'package:flutter/material.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/utils/constants/sizes.dart';
import 'widgets/orders_list_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.md),
        child: ListView.separated(
          itemBuilder: (_, index) {
            return const OrdersListItem();
          },
          separatorBuilder: (_, index) {
            return const SizedBox(height: CSizes.md);
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
