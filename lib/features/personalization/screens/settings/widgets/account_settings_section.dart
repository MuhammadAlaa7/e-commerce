import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/core/common/widgets/texts/section_heading.dart';
import 'package:store/features/personalization/screens/address/adress_screen.dart';
import 'package:store/features/personalization/screens/settings/widgets/settings_menu_tile.dart';
import 'package:store/features/shop/screens/cart/cart_screen.dart';
import 'package:store/features/shop/screens/orders/orders_screen.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class AccountSettingsSection extends StatelessWidget {
  const AccountSettingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeadingSection(
          title: 'Account Settings',
          showActionButton: false,
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems,
        ),
        SettingsMenuTile(
          icon: Iconsax.safe_home,
          title: 'My Addresses',
          subTitle: 'Set shopping delivery address',
          onTap: () {
            AppHelperFunctions.navigateToScreen(
                context, const AddressesScreen());
          },
        ),
        SettingsMenuTile(
          icon: Iconsax.shopping_cart,
          title: 'My Cart',
          subTitle: 'Add, or remove products and move to checkout',
          onTap: () {
            Get.to(() => const CartScreen());
          },
        ),
        SettingsMenuTile(
          icon: Iconsax.bag_tick,
          title: 'My Orders',
          subTitle: 'In-progress, completed, and canceled orders',
          onTap: () {
            AppHelperFunctions.navigateToScreen(context, const OrdersScreen());
          },
        ),
        SettingsMenuTile(
          icon: Iconsax.bank,
          title: 'Bank Account',
          subTitle: 'Withdraw balance to a registered bank account',
          onTap: () {},
        ),
        SettingsMenuTile(
          icon: Iconsax.discount_shape,
          title: 'My Coupons',
          subTitle: 'List of all discount coupons',
          onTap: () {},
        ),
        SettingsMenuTile(
          icon: Iconsax.notification,
          title: 'Notifications',
          subTitle: 'Set any kind of notification messages',
          onTap: () {},
        ),
        SettingsMenuTile(
          icon: Iconsax.security_card,
          title: 'Account Privacy',
          subTitle: 'Manage data usage and connected accounts',
          onTap: () {},
        ),
      ],
    );
  }
}
