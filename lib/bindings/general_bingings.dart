import 'package:get/get.dart';
import 'package:store/data/repos/user_repo.dart';
import 'package:store/features/auth/controllers/login/login_controller.dart';
import 'package:store/features/auth/controllers/signup/signup_controller.dart';
import 'package:store/features/auth/controllers/verify_email/verify_email_controller.dart';
import 'package:store/utils/manager/network_manger.dart';

class GeneralBingings extends Bindings {
  /*
Use Get.put for objects that need to be ready as soon as the app starts 
(e.g., critical services or managers). 
Use Get.lazyPut for objects that can be instantiated on-demand.
  */

  @override
  void dependencies() {
    // This means that NetworkManager can now be accessed from any part of the app using Get.find<NetworkManager>().
    Get.put(NetworkManager());

    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => LogInController());
    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => VerifyEmailController());
  }
}
