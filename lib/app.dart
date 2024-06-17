import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/bindings/general_bingings.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/helper/helper_functions.dart';

import 'package:store/utils/theme/theme.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GeneralBingings(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: CAppTheme.lightThemData,
      darkTheme: CAppTheme.darkThemData,

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
      backgroundColor:
          CHelperFunctions.isDarkMode(context) ? CColors.dark : CColors.primary,
      body: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
