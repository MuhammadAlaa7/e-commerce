import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
          GoogleSignIn().signOut();
          GoogleSignIn().disconnect();

        
          Get.offAll(() => const LoginScreen());
        },
      ),
      body:const  SingleChildScrollView(
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
