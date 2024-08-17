import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: Text('Re-Authenticate User')),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Email
            TextFormField(
              controller: controller.verifyEmail,
              validator: TValidator.validateEmail,
              decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),

            /// Password
            Obx(() => TextFormField(
                  obscureText: controller.hidePassword.value,
                  controller: controller.verifyPassword,
                  validator: (value) =>
                      TValidator.validateEmptyText('Password', value),
                  decoration: InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: Icon(Iconsax.eye_slash),
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(Iconsax.eye_slash),
                      )),
                )),
            SizedBox(height: TSizes.spaceBtwSections),

            /// Login Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () =>
                      controller.reAuthenticateEmailAndPasswordUser(),
                  child: Text('Verify')),
            ),
          ],
        ),
      )),
    );
  }
}
