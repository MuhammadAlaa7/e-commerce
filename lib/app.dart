import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/bindings/general_bindings.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

import 'package:store/core/utils/theme/theme.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoutes.pages,
      initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightThemData,
      darkTheme: AppTheme.darkThemData,

      //* show a waiting loader while the app decide which screen to go
      home: _WaitingScreen(),
    );
  }
}

// }
class _WaitingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppHelperFunctions.isDarkMode(context)
          ? AppColors.dark
          : AppColors.primary,
      body: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
