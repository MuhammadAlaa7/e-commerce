import 'package:get/get.dart';
import 'package:store/features/auth/screens/email_verification_screen/verify_email_screen.dart';
import 'package:store/features/auth/screens/login_screen/login_screen.dart';
import 'package:store/features/auth/screens/password_configuration_screen/forget_password_screen.dart';
import 'package:store/features/auth/screens/password_configuration_screen/password_reset_screen.dart';
import 'package:store/features/auth/screens/signup_screen/signup_screen.dart';
import 'package:store/features/on_boarding/screens/onboarding_screen/onboarding_screen.dart';
import 'package:store/features/personalization/screens/address/add_new_address_screen.dart';
import 'package:store/features/personalization/screens/address/adress_screen.dart';
import 'package:store/features/personalization/screens/profile/profile_screen.dart';
import 'package:store/features/personalization/screens/profile/widgets/change_name_screen.dart';
import 'package:store/features/personalization/screens/profile/widgets/re_auth_user_login_form.dart';
import 'package:store/features/personalization/screens/settings/account_screen.dart';
import 'package:store/features/shop/screens/all_products/all_products_screen.dart';
import 'package:store/features/shop/screens/brands/all_brands_screen.dart';
import 'package:store/features/shop/screens/brands/brand_products_screen.dart';
import 'package:store/features/shop/screens/cart/cart_screen.dart';
import 'package:store/features/shop/screens/checkout/checkout_screen.dart';
import 'package:store/features/shop/screens/home/home_screen.dart';
import 'package:store/features/shop/screens/orders/orders_screen.dart';
import 'package:store/features/shop/screens/product_details/product_details_screen.dart';
import 'package:store/features/shop/screens/rating_reviews/rating_review_screen.dart';
import 'package:store/features/shop/screens/store/store_screen.dart';
import 'package:store/features/shop/screens/wishlist/wishlist_screen.dart';
import 'package:store/core/routes/app_routes.dart';

import '../../features/shop/screens/sub_categories/sub_categories_screen.dart';

class AppPages {
  // pages for getx
  static final pages = [
    // -- auth pages --
    GetPage(
      name: AppRoutes.onBoarding,
      page: () => const OnBoardingScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => const ForgetPasswordScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordSuccessScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.verifyEmail,
      page: () => const VerifyEmailScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    //
    // home pages --
    //

    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.cart,
      page: () => const CartScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.subCategories,
      page: () => const SubCategoriesScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.viewAllProducts,
      page: () => const AllProductsScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.productDetails,
      page: () => const ProductDetailsScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    //
    // Store pages --
    //

    GetPage(
      name: AppRoutes.store,
      page: () => const StoreScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.allBrands,
      page: () => const AllBrandsScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.brandProducts,
      page: () => const BrandProductsScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.wishlist,
      page: () => const WishlistScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

//
// account pages --

    GetPage(
      name: AppRoutes.account,
      page: () => const AccountScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.address,
      page: () => const AddressesScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.order,
      page: () => const OrdersScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.reAuthUser,
      page: () => const ReAuthUserLoginForm(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.changeName,
      page: () => const ChangeNameScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.checkout,
      page: () => const CheckoutScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.productReview,
      page: () => const ProductReviewScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.newAddress,
      page: () => const AddNewAddressScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
