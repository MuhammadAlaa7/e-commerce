import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/auth/controllers/verify_email/verify_email_controller.dart';
import 'package:store/features/auth/screens/login_screen/login_screen.dart';
import 'widgets/home_body.dart';
import 'widgets/home_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        
          FirebaseAuth.instance.signOut();

        
          Get.offAll(() => const LoginScreen());
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // * blue container header with curved edges
            HomeHeader(),

            // * -- Home body
            HomeBody(),
          ],
        ),
      ),
    );
  }
}
