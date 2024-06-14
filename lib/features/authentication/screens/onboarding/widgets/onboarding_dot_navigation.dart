import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:t_store/features/authentication/controllers.onboarding/onboarding_controller.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
      bottom:
          TDeviceUtils.getBottomNavigationBarHeight() + TSizes.defaultSpace * 2,
      left: TSizes.defaultSpace,
      right: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,
        controller: controller.pageController,
        onDotClicked: (index) => controller.dotNavigationClick(index),
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? TColors.primary : Colors.black,
          dotHeight: 6,
        ),
      ),
    );
  }
}
