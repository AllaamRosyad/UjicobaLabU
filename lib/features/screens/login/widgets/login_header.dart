import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

Column TLoginHeader(bool dark, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image(
        height: 150,
        image: AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo),
      ),
      Text(
        TTexts.loginTitle,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      SizedBox(height: TSizes.sm),
      Text(
        TTexts.loginSubTitle,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ],
  );
}
