import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication_repository.dart';
import 'package:t_store/data/repositories/user_repository.dart';
import 'package:t_store/features/authentication/models/user_model.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
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
  void signup() async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.loadingScreen);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        /// Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!signupFormKey.currentState!.validate()) {
        /// Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy & Term of Use.');
        return;
      }

      /// Register user in the Firebase Authentication & Save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      /// Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      /// Remove Loader
      TFullScreenLoader.stopLoading();

      /// Show Success Message
      TLoaders.succesSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue.');

      /// Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      /// Remove Loader
      TFullScreenLoader.stopLoading();

      /// Show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
