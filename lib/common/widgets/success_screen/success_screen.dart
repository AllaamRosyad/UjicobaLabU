// import 'package:flutter/material.dart';
// import 'package:t_store/common/styles/spacing_styles.dart';
// import 'package:t_store/utils/constants/sizes.dart';
// import 'package:t_store/utils/constants/text_strings.dart';
// import 'package:t_store/utils/helpers/helper_functions.dart';

// class SuccessScreen extends StatelessWidget {
//   const SuccessScreen(
//       {super.key,
//       required this.image,
//       required this.title,
//       required this.subTitle,
//       required this.onPressed});

//   final String image, title, subTitle;
//   final VoidCallback onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: TSpacingStyle.paddingWithAppBarHeight * 2,
//           child: Column(
//             children: [
//               ///Image
//               Image(
//                 image: AssetImage(image),
//                 width: THelperFunctions.screenWidth() * 0.6,
//               ),
//               const SizedBox(height: TSizes.spaceBtwSections),

//               ///Title & SubTitle
//               Text(title,
//                   style: Theme.of(context).textTheme.headlineMedium,
//                   textAlign: TextAlign.center),
//               const SizedBox(height: TSizes.spaceBtwItems),
//               Text(subTitle,
//                   style: Theme.of(context).textTheme.labelMedium,
//                   textAlign: TextAlign.center),
//               const SizedBox(height: TSizes.spaceBtwSections),

//               ///Buttons
//               SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                       onPressed: onPressed, child: const Text(TTexts.tContinue))),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Image or Lottie Animation
              _buildImageOrAnimation(),

              const SizedBox(height: TSizes.spaceBtwSections),

              /// Title & SubTitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(TTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// A method to choose between rendering an image or a Lottie animation
  Widget _buildImageOrAnimation() {
    if (image.endsWith('.json')) {
      // Render Lottie animation
      return Lottie.asset(
        image,
        width: THelperFunctions.screenWidth() * 0.6,
      );
    } else {
      // Render image
      return Image(
        image: AssetImage(image),
        width: THelperFunctions.screenWidth() * 0.6,
      );
    }
  }
}
