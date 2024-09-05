import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:store/app.dart';
import 'package:store/data/repos/auth_repo.dart';
import 'package:store/firebase_options.dart';

void main() async {
  //* this is to ensure that flutter framework is fully initialized before running the app
  //It ensures that the Flutter framework is ready before any widget-related operations are performed.  such as splash screen
  // By ensuring that the framework is initialized at the start, it helps prevent errors that could occur if parts of the framework are accessed before they are ready.
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //* Initialize Hive
  //  to get the directory where the application can store its documents.
  //This directory is specific to each application and is used to store
  // files that are not meant to be shared with other applications.
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  // give hive the path to the app directory to put its database into it 
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox('storage');

  //* Preserve splash screen >>>> indicating that the splash screen should be preserved until the necessary flutter initializations are complete.
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //* Initialize Firebase < set up the firebase app > to use its services like auth and firebase store
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp firebaseResult) => Get.put(AuthenticationRepository()),
  );


  runApp(const StoreApp());
}

/* 
put: The put method is used to put an instance of a class into 
the GetX dependency injection system.
 This means that the instance of the class will be available
  to all widgets that use it. by providing it to the widgets to access it 
  using the Get.find() method.
 */
