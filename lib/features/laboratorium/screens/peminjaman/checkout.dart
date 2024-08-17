import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/features/laboratorium/screens/cart/widgets/cart_items.dart';
import 'package:t_store/features/laboratorium/screens/home/widgets/rounded_container.dart';
import 'package:t_store/features/laboratorium/screens/peminjaman/widgets/checkout_peminjaman.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Items in cart
              TCartItems(showAddRemoveButtons: false),
              SizedBox(height: TSizes.spaceBtwSections),

              /// Peminjaman Section
              TRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    /// Peminjaman
                    TPeminjaman(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                  image: TImages.successfulPaymentIcon,
                  title: 'Peminjaman Success!',
                  subTitle:
                      'Mohon barang dijaga dengan baik & dikembalikan tepat waktu',
                  onPressed: () => Get.offAll(() => NavigationMenu()),
                )),
            child: Text('Peminjaman')),
      ),
    );
  }
}
