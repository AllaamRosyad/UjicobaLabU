// import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:t_store/app.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:t_store/data/repositories/authentication_repository.dart';
// import 'firebase_options.dart';

// Future<void> main() async {
//   /// Todo : add Widgets Binding
//   final WidgetsBinding widgetsBinding =
//       WidgetsFlutterBinding.ensureInitialized();

//   /// GetX Local Storage
//   await GetStorage.init();

//   /// Todo : Init Payment MEthods
//   /// Todo : Await Native Splash
//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

//   /// Todo : Initialize Authentication
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
//       .then(
//     (FirebaseApp value) => Get.put(AuthenticationRepository()),
//   );

//   ///

//   /// Load all the Material Design / Themes / Localizations / Sindings
//   runApp(const App());
// }

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:t_store/data/repositories/authentication_repository.dart';
import 'package:t_store/features/laboratorium/controllers/category_controller.dart'; // Import the CategoryController
import 'firebase_options.dart';

Future<void> main() async {
  /// Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  /// GetX Local Storage
  await GetStorage.init();

  /// Preserve native splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Initialize Firebase and Authentication
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) {
      Get.put(AuthenticationRepository());
      Get.put(CategoryController()); // Register CategoryController
    },
  );

  /// Run the app
  runApp(const App());
}
