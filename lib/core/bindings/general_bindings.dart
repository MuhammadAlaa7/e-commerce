import 'package:get/get.dart';
import 'package:store/data/repos/user_repo.dart';
import 'package:store/features/auth/controllers/forget_password/forget_password_controller.dart';
import 'package:store/features/auth/controllers/login/login_controller.dart';
import 'package:store/features/auth/controllers/signup/signup_controller.dart';
import 'package:store/features/auth/controllers/social_controller.dart';
import 'package:store/features/auth/controllers/verify_email/verify_email_controller.dart';
import 'package:store/features/on_boarding/controllers/onboarding/on_boarding_controller.dart';
import 'package:store/features/personalization/controllers/address_controller.dart';
import 'package:store/features/personalization/controllers/user_controller.dart';
import 'package:store/features/shop/controllers/cart/cart_item_controller.dart';
import 'package:store/features/shop/controllers/product/product_images_controller.dart';
import 'package:store/features/shop/controllers/product/product_order_controller.dart';
import 'package:store/features/shop/controllers/product/product_variation_controller.dart';
import 'package:store/core/utils/helper/network_manager.dart';

import '../../features/shop/controllers/category/category_controller.dart';
import '../../features/shop/controllers/product/product_checkout_controller.dart';
import '../../features/shop/controllers/product/favorite_product_controller.dart';
import '../../features/shop/controllers/product/product_controller.dart';

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

/* 
With fenix:
When you use Get.lazyPut() with fenix: true, the controller is not immediately created
Instead, it is lazily instantiated when it is first accessed. 
The key feature of fenix is that even after the controller is deleted from memory 
(for example, when navigating away from a page), it will be automatically recreated 
the next time it is needed. This allows for a more seamless user experience, 
as the controller is always available when required,

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

  //  Get.lazyPut(() => UserController(), fenix: true);
    Get.put(
        NetworkManager()); // if the controller was deleted , it will not be automatically recreated
    Get.put(VariationController());
    Get.lazyPut(() => AddressController(), fenix: true);
    Get.lazyPut(() => CheckoutController(), fenix: true);
    Get.lazyPut(() => OrderController(), fenix: true);
    Get.lazyPut(() => OnBoardingController(), fenix: true);

    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);

    Get.lazyPut(() => UserRepository(), fenix: true);
    Get.lazyPut(() => SocialController(), fenix: true);

    Get.lazyPut(() => VerifyEmailController(), fenix: true);
    Get.lazyPut(() => CartItemController(), fenix: true);
    Get.lazyPut(() => CategoryController(), fenix: true);
    Get.lazyPut(() => ProductController(), fenix: true);
    Get.lazyPut(() => FavoriteController(), fenix: true);
    Get.lazyPut(() => OrderController(), fenix: true);
    Get.lazyPut(() => ProductImagesController(), fenix: true);

  }
}
