import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/controllers/onboarding_controller.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(onPressed: () {}, child: Text('Skip')),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:t_store/features/authentication/controllers.onboarding/onboarding_controller.dart';
// import '../../../../../utils/constants/sizes.dart';
// import '../../../../../utils/device/device_utility.dart';

// class OnBoardingSkip extends StatelessWidget {
//   final OnBoardingController controller;

//   const OnBoardingSkip({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: TDeviceUtils.getAppBarHeight(),
//       right: TSizes.defaultSpace,
//       child: TextButton(
//         onPressed: controller.skipPage,
//         child: Text('Skip'),
//       ),
//     );
//   }
// }
