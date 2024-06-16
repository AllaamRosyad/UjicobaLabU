import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/signup/signup.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

Form TLoginForm() {
  return Form(
      child: Padding(
    padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
    child: Column(
      children: [
        ///Email
        TextFormField(
          decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right), labelText: TTexts.email),
        ),
        SizedBox(height: TSizes.spaceBtwInputFields),

        ///Password
        TextFormField(
          decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              labelText: TTexts.password,
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),
        SizedBox(height: TSizes.spaceBtwInputFields / 2),

        ///Remember Me & Forget Password
        Row(children: [
          /// Remember Me
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(value: true, onChanged: (value) {}),
              Text(TTexts.rememberMe),
            ],
          ),

          ///Forgot Password
          TextButton(onPressed: () {}, child: Text(TTexts.forgetPassword))
        ]),
        SizedBox(height: TSizes.spaceBtwInputFields),

        ///Sign In Button
        SizedBox(
            width: double.infinity,
            child:
                ElevatedButton(onPressed: () {}, child: Text(TTexts.signIn))),
        SizedBox(height: TSizes.spaceBtwItems),

        ///Create account button
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {},
                child: OutlinedButton(
                    onPressed: () => Get.to(() => SignupScreen()),
                    child: Text(TTexts.createAccount)))),
        SizedBox(height: TSizes.spaceBtwSections),
      ],
    ),
  ));
}
