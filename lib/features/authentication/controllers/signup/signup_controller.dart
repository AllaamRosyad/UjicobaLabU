import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/loaders/loaders.dart';
import 'package:t_store/utils/networks/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variable
  /// Observable for hiding/showing for privacy policy
  final privacyPolicy = true.obs;

  /// Observable for hiding/showing password
  final hidePassword = true.obs;

  /// Controller for email input
  final email = TextEditingController();

  /// Controller for last name input
  final lastName = TextEditingController();

  /// Controller for username input
  final username = TextEditingController();

  /// Controller for password input
  final password = TextEditingController();

  /// Controller for first name input
  final firstName = TextEditingController();

  /// Controller for phone number input
  final phoneNumber = TextEditingController();

  /// Form key for form validation
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///  SignUp
  Future<void> signup() async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.loadingScreen);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      /// Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      /// Privacy Policy Check

      /// Register user in the Firebase Authentication & Save user data in the firebase

      /// Save Authenticated user data in the Firebase Firestore

      /// Show Success Message

      /// Move to Verify Email Screen3
    } catch (e) {
      /// Show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      /// Remove Loader
      TFullScreenLoader.stopLoading();
    }
  }
}
