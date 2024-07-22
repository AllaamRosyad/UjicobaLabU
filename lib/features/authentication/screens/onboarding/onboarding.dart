import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:t_store/features/authentication/controllers/onboarding_controller.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrolgelable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                  image: TImages.onBoardingImage1,
                  title: TTexts.onBoardingTitle1,
                  subTitle: TTexts.onBoardingSubTitle1),
              OnBoardingPage(
                  image: TImages.onBoardingImage2,
                  title: TTexts.onBoardingTitle2,
                  subTitle: TTexts.onBoardingSubTitle2),
              OnBoardingPage(
                  image: TImages.onBoardingImage3,
                  title: TTexts.onBoardingTitle3,
                  subTitle: TTexts.onBoardingSubTitle3),
            ],
          ),

          /// Skip button
          OnBoardingSkip(),

          /// Dot navigation smootpageindicator
          OnBoardingDotNavigation(),

          /// Circular Button
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:t_store/features/authentication/controllers.onboarding/onboarding_controller.dart';
// import 'package:t_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
// import 'package:t_store/utils/constants/colors.dart';
// import 'package:t_store/utils/constants/image_strings.dart';
// import 'package:t_store/utils/constants/sizes.dart';
// import 'package:t_store/utils/constants/text_strings.dart';
// import '../../../../utils/device/device_utility.dart';
// import '../../../../utils/helpers/helper_functions.dart';
// import 'widgets/onboarding_dot_navigation.dart';
// import 'widgets/onboarding_page.dart';
// import 'widgets/onboarding_skip.dart';

// class OnBoardingScreen extends StatelessWidget {
//   const OnBoardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(OnBoardingController());

//     return Scaffold(
//       body: Stack(
//         children: [
          /// Horizontal Scrollable Pages
//           PageView(
//             controller: controller.pageController,
//             onPageChanged: controller.updatePageIndicator,
//             children: [
//               OnBoardingPage(
//                   image: TImages.onBoardingImage1,
//                   title: TTexts.onBoardingTitle1,
//                   subTitle: TTexts.onBoardingSubTitle1),
//               OnBoardingPage(
//                   image: TImages.onBoardingImage2,
//                   title: TTexts.onBoardingTitle2,
//                   subTitle: TTexts.onBoardingSubTitle2),
//               OnBoardingPage(
//                   image: TImages.onBoardingImage3,
//                   title: TTexts.onBoardingTitle3,
//                   subTitle: TTexts.onBoardingSubTitle3),
//             ],
//           ),

//           /// Skip button
//           OnBoardingSkip(controller: controller),

//           /// Dot navigation SmoothPageIndicator
//           Positioned(
//             bottom: 80,
//             left: 20,
//             right: 20,
//             child: OnBoardingDotNavigation(controller: controller),
//           ),

//           /// Circular Button
//           Positioned(
//             bottom: 20,
//             right: 20,
//             child: OnBoardingNextButton(controller: controller),
//           ),
//         ],
//       ),
//     );
//   }
// }
