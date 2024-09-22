import 'package:get/get.dart';
import 'package:store/data/repos/user_repo.dart';
import 'package:store/features/auth/controllers/forget_password/forget_password_controller.dart';
import 'package:store/features/auth/controllers/login/login_controller.dart';
import 'package:store/features/auth/controllers/signup/signup_controller.dart';
import 'package:store/features/auth/controllers/social_controller.dart';
import 'package:store/features/auth/controllers/verify_email/verify_email_controller.dart';
import 'package:store/features/on_boarding/controllers/onboarding/on_boarding_controller.dart';
import 'package:store/features/personalization/controllers/user/address_controller.dart';
import 'package:store/features/personalization/controllers/user/user_controller.dart';
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

// Explanation :
/* 
* Get.lazyPut is used to creates the dependency of the controller in the system 
 but when using the Get.find  it will load the dependency to the memory to use it 
 when the controller is deleted from the memory when its screen removed from navigation stack . 
 and if you come back again to the screen it will not load the dependency again.
 * Get.lazyPut only creates the controller one time when it is used .
 * if you need to create the controller multiple times you can use Get.lazyPut with fenix : true .
 * Get.lazyPut(() => the controller () , fenix : true )
 */

  @override
  void dependencies() {
    // This means that NetworkManager can now be accessed from any part of the app using Get.find<NetworkManager>().
      // the user controller needs to be exist along the app is running 
      // so if the user log out and log in , no issues happen
    Get.put(
      UserController(),
      permanent: true,
    );
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.lazyPut(() => AddressController());
    Get.lazyPut(() => CheckoutController());
    Get.lazyPut(() => OrderController());
    Get.lazyPut(() => OnBoardingController());

    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => LogInController(), fenix: true);

    Get.lazyPut(() => UserRepository(), fenix: true);
    Get.lazyPut(() => SocialController(), fenix: true);

    Get.lazyPut(() => VerifyEmailController());
  }
}
