import 'package:flutter/material.dart';

// Constants
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

// Helpers
import 'package:t_store/utils/helpers/helper_functions.dart';

// Styles
import 'package:t_store/common/styles/spacing_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Sub-Title,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 150,
                    image: AssetImage(
                        dark ? TImages.lightAppLogo : TImages.darkAppLogo),
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
              ),
              //Form
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: TTexts.email,
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: TSizes.sm),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: TTexts.password,
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: TSizes.md),
                    ElevatedButton(
                      onPressed: () {
                        // Add login functionality here
                      },
                      child: Text(TTexts.signIn),
                    ),
                    SizedBox(height: TSizes.sm),
                    TextButton(
                      onPressed: () {
                        // Add forgot password functionality here
                      },
                      child: Text(TTexts.forgetPassword),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
