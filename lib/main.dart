import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:store/app.dart';
import 'package:store/data/repos/auth_repo.dart';
import 'package:store/firebase_options.dart';

void main() async {
  //* this is to ensure that flutter framework is fully initialized before running the app
  //It ensures that the Flutter framework is ready before any widget-related operations are performed.
  //such as splash screen
  // By ensuring that the framework is initialized at the start,
  //it helps prevent errors that could occur if parts of the framework are accessed
  // before they are ready.
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //* Initialize Hive
  //to get the directory where the application can store its documents.
  //This directory is specific to each application and is used to store
  // files that are not meant to be shared with other applications.
  //****final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  // give hive the path to the app directory to put its database into it
  // Hive.init(appDocumentDirectory.path);

  /* 
  Hive.initFlutter() automatically handles the directory selection for you by using 
  the Flutter application's cache directory. 
  This cache directory is a platform-specific location where Flutter stores
   various application-related data, including Hive's data files.
   */
  await Hive.initFlutter();
  await Hive.openBox('auth');
 
  // Open Hive box for theme [dark mode and light mode]
  var box = await Hive.openBox('theme');

  // Get the saved theme mode or default to light mode
  // return the default value if the key is null or not found
  bool isDarkMode = box.get('isDarkMode', defaultValue: false);

  

  //* Preserve splash screen >>>> indicating that the splash screen should be preserved
  //*until the necessary flutter initializations are completed.
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //* Initialize firebase means to set up the firebase on the app to use its services.
  //* Initialize Firebase < set up the firebase app > to use its services like auth and firebase store
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp firebaseResult) => Get.put(AuthenticationRepository()),
  );
  // Remove the splash screen after initializations are complete
  FlutterNativeSplash.remove();


  runApp( StoreApp(isDarkMode: isDarkMode,));
}
