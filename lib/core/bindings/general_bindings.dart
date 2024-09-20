import 'package:get/get.dart';
import 'package:store/data/repos/user_repo.dart';
import 'package:store/features/auth/controllers/login/login_controller.dart';
import 'package:store/features/auth/controllers/signup/signup_controller.dart';
import 'package:store/features/auth/controllers/verify_email/verify_email_controller.dart';
import 'package:store/features/on_boarding/controllers/onboarding/on_boarding_controller.dart';
import 'package:store/features/personalization/controllers/user/address_controller.dart';
import 'package:store/features/shop/controllers/product/order_controller.dart';
import 'package:store/features/shop/controllers/product/variation_controller.dart';
import 'package:store/core/utils/helper/network_manager.dart';

import '../../features/shop/controllers/product/checkout_controller.dart';

class GeneralBindings extends Bindings {
  /*
Use Get.put for objects that need to be ready as soon as the app starts 
(e.g., critical services or managers). 
Use Get.lazyPut for objects that can be instantiated on-demand.
  */

  @override
  void dependencies() {
    // This means that NetworkManager can now be accessed from any part of the app using Get.find<NetworkManager>().

    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.lazyPut(() => AddressController());
    Get.lazyPut(() => CheckoutController());
    Get.lazyPut(() => OrderController());
    Get.lazyPut(() => OnBoardingController()) ; 

    // Get.lazyPut(() => SignUpController());
    // Get.lazyPut(() => LogInController());
    // Get.lazyPut(() => UserRepository());

//    Get.lazyPut(() => VerifyEmailController());
  }
}
