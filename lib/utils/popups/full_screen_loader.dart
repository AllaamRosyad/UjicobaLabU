import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

/// A utility class for managing a full-screen loading dialog
class TFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation.
  /// This method doesn't return anything.
  ///
  /// Parameters:
  /// - Text: the text to be displayed in the loading dialog.
  /// - animation: the lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(

        ///Use Get.overlayContext for overlay dialogs
        context: Get.overlayContext!,

        /// The dialog can't be dismissed by tapping outside it
        barrierDismissible: false,

        /// Disable popping with the back button
        builder: (_) => PopScope(
            canPop: false,
            child: Container(
              color: THelperFunctions.isDarkMode(Get.context!)
                  ? TColors.dark
                  : TColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 250,

                    /// Adjust the spacing as needed
                  ),
                  TAnimationLoaderWidget(text: text, animation: animation),
                ],
              ),
            )));
  }

  /// Stop the currently open loading dialog.
  /// This method doesn't return anything.
  static stopLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); // Close the dialog using the Navigator
  }
}
