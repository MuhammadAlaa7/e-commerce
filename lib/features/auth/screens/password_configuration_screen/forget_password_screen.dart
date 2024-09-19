import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/styles/text_styles.dart';
import 'package:store/common/widgets/buttons/default_button.dart';
import 'package:store/common/widgets/input_field/input_field.dart';
import 'package:store/features/auth/controllers/forget_password/forget_password_controller.dart';
import 'package:store/features/auth/screens/password_configuration_screen/password_reset_screen.dart';
import 'package:store/utils/constants22/sizes.dart';
import 'package:store/utils/constants22/text_strings.dart';
import 'package:store/utils/helper/helper_functions.dart';
import 'package:store/utils/validators/custom_validator.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});




  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();


  
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final controller = Get.put(ForgetPasswordController());
@override
  void initState() {
    controller.email.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ************************** Headings **************************
              Text(
                CTexts.forgetPasswordTitle,
                style: CTextStyles.titleTextStyle(context),
              ),
              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              Text(
                CTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: CSizes.spaceBetweenSections,
              ),

              /// ************************** FORM ***********************
               Form(
                key: controller.forgetPasswordFormKey,
                 child: InputField(
                        controller:  controller.email,
                        validator: CValidator.validateEmail,
                 
                  label: 'E-mail',
                  prefixIcon: Iconsax.direct_right,
                               ),
               ),
              const SizedBox(
                height: CSizes.spaceBetweenSections,
              ),


              //* --------------------- SUBMIT button ----------------------
              DefaultButton(
                label: 'Submit',
                onPressed: () {
                        controller.sendPasswordResetEmail();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
