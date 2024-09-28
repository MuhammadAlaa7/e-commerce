import 'package:get/get.dart';
import 'package:store/features/auth/screens/password_configuration_screen/forget_password_screen.dart';
import 'package:store/features/personalization/screens/address/adress_screen.dart';
import 'package:store/features/personalization/screens/profile/profile_screen.dart';
import 'package:store/features/personalization/screens/settings/settings_screen.dart';
import 'package:store/features/shop/screens/brands/brand_products_screen.dart';
import 'package:store/features/shop/screens/cart/cart_screen.dart';
import 'package:store/features/shop/screens/home/home_screen.dart';
import 'package:store/features/shop/screens/rating_reviews/rating_review_screen.dart';
import 'package:store/features/shop/screens/store/store_screen.dart';
import 'package:store/features/shop/screens/wishlist/wishlist_screen.dart';
import 'package:store/core/routes/routes.dart';

import '../../features/shop/screens/sub_categories/sub_categories_screen.dart';

class AppRoutes {
  // pages for getx
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(name: Routes.store, page: () => const StoreScreen()),
    GetPage(name: Routes.settings, page: () => const AccountScreen()),
    GetPage(
        name: Routes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: Routes.userProfile, page: () => const ProfileScreen()),
    GetPage(
        name: Routes.productReview, page: () => const ProductReviewScreen()),
    //GetPage(name: Routes.allProducts, page: ()=>const AllProductsScreen() ),
    GetPage(
      name: Routes.brandProducts,
      page: () => const BrandProductsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(name: Routes.userAddress, page: () => const AddressesScreen()),
    GetPage(name: Routes.wishlist, page: () => const WishlistScreen()),
    GetPage(
        name: Routes.subCategories, page: () => const SubCategoriesScreen()),
    GetPage(name: Routes.cart, page: () => const CartScreen()),
  ];
}
