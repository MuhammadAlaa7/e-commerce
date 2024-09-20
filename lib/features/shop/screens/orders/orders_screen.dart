import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/core/common/widgets/loaders/animated_loader.dart';
import 'package:store/core/common/widgets/shimmers/orders_shimmer.dart';
import 'package:store/features/shop/controllers/product/order_controller.dart';
import 'package:store/features/shop/models/order_model.dart';
import 'package:store/features/shop/screens/orders/widgets/orders_list_item.dart';
import 'package:store/navigation_menu.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/cloud_helper_functions.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = OrderController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: FutureBuilder(
        future: orderController.fetchAllUserOrders(),
        builder: (context, snapshot) {
          final emptyWidget = AnimationLoaderWidget(
            text: 'Whoops! No Orders yet',
            animationImage: AppImages.emptyAnimation,
            showAction: true,
            actionText: 'Let\'s fill it up',
            onActionPressed: () => Get.off(() => const HomeMenu()),
          );
          const loader = OrdersShimmer();
          final widget = CustomCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
          if (widget != null) return widget;

          final orders = snapshot.data as List<OrderModel>;

          return Padding(
            padding: const EdgeInsets.all(AppSizes.md),
            child: ListView.separated(
              itemBuilder: (_, index) {
                return OrderItem(
                  order: orders[index],
                );
              },
              separatorBuilder: (_, index) {
                return const SizedBox(height: AppSizes.md);
              },
              itemCount: orders.length,
            ),
          );
        },
      ),
    );
  }
}
