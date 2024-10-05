import 'package:get/get.dart';
import 'package:store/features/auth/screens/email_verification_screen/verify_email_screen.dart';
import 'package:store/features/auth/screens/login_screen/login_screen.dart';
import 'package:store/features/auth/screens/password_configuration_screen/forget_password_screen.dart';
import 'package:store/features/auth/screens/password_configuration_screen/password_reset_screen.dart';
import 'package:store/features/auth/screens/signup_screen/signup_screen.dart';
import 'package:store/features/on_boarding/screens/onboarding_screen/onboarding_screen.dart';
import 'package:store/features/personalization/screens/address/adress_screen.dart';
import 'package:store/features/personalization/screens/profile/profile_screen.dart';
import 'package:store/features/personalization/screens/settings/account_screen.dart';
import 'package:store/features/shop/screens/brands/brand_products_screen.dart';
import 'package:store/features/shop/screens/cart/cart_screen.dart';
import 'package:store/features/shop/screens/home/home_screen.dart';
import 'package:store/features/shop/screens/rating_reviews/rating_review_screen.dart';
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
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => const ForgetPasswordScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordSuccessScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.verifyEmail,
      page: () => const VerifyEmailScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 550),
    ),

    //
    //
    //

    GetPage(name: AppRoutes.settings, page: () => const AccountScreen()),
    GetPage(
        name: AppRoutes.forgetPassword,
        page: () => const ForgetPasswordScreen()),
    GetPage(name: AppRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(
        name: AppRoutes.productReview, page: () => const ProductReviewScreen()),
    //GetPage(name: Routes.allProducts, page: ()=>const AllProductsScreen() ),
    GetPage(
      name: AppRoutes.brandProducts,
      page: () => const BrandProductsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(name: AppRoutes.userAddress, page: () => const AddressesScreen()),
    GetPage(name: AppRoutes.wishlist, page: () => const WishlistScreen()),
    GetPage(
        name: AppRoutes.subCategories, page: () => const SubCategoriesScreen()),
    GetPage(name: AppRoutes.cart, page: () => const CartScreen()),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
