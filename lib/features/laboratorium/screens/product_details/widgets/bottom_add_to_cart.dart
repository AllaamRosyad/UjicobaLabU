import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/features/laboratorium/controllers/cart_controller.dart';
import 'package:t_store/features/laboratorium/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    controller.updateAlreadyAddedProductCount(product);
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.light,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg),
          )),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TCircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: TColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: TColors.white,
                  onPressed: controller.productQuantityInCart.value < 1
                      ? null
                      : () => controller.productQuantityInCart.value -= 1,
                ),
                SizedBox(width: TSizes.spaceBtwItems),
                Text(
                  controller.productQuantityInCart.value.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(width: TSizes.spaceBtwItems),
                TCircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: TColors.black,
                  width: 40,
                  height: 40,
                  color: TColors.white,
                  onPressed: () => controller.productQuantityInCart.value += 1,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1
                  ? null
                  : () => controller.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(TSizes.md),
                backgroundColor: TColors.black,
                side: BorderSide(color: TColors.black),
              ),
              child: Text('Masukkan Keranjang'),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
// import 'package:t_store/utils/constants/colors.dart';
// import 'package:t_store/utils/constants/sizes.dart';
// import 'package:t_store/utils/helpers/helper_functions.dart';

// class TBottomAddToCart extends StatelessWidget {
//   const TBottomAddToCart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     return Container(
//       padding: EdgeInsets.symmetric(
//           horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
//       decoration: BoxDecoration(
//           color: dark ? TColors.darkerGrey : TColors.light,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(TSizes.cardRadiusLg),
//             topRight: Radius.circular(TSizes.cardRadiusLg),
//           )),
//       child: Row(
//         children: [
//           Row(
//             children: [
//               TCircularIcon(
//                   icon: Iconsax.minus,
//                   backgroundColor: TColors.darkGrey,
//                   width: 40,
//                   height: 40,
//                   color: TColors.white),
//               SizedBox(width: TSizes.spaceBtwItems),
//               Text('2', style: Theme.of(context).textTheme.titleSmall),
//               SizedBox(width: TSizes.spaceBtwItems),
//               TCircularIcon(
//                   icon: Iconsax.add,
//                   backgroundColor: TColors.black,
//                   width: 40,
//                   height: 40,
//                   color: TColors.white),
//             ],
//           ),
//           SizedBox(width: TSizes.spaceBtwItems),

//           /// Expanded buttons to prevent overflow
//           Expanded(
//             child: ElevatedButton(
//               onPressed: () {
//                 // Action for Cek Lokasi
//               },
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: TSizes.sm),
//                 backgroundColor: TColors.black,
//                 side: BorderSide(color: TColors.black),
//               ),
//               child: Text('Cek Lokasi'),
//             ),
//           ),
//           SizedBox(width: TSizes.spaceBtwItems),
//           Expanded(
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: TSizes.sm),
//                   backgroundColor: TColors.black,
//                   side: BorderSide(color: TColors.black)),
//               child: Text('Masukkan Keranjang', textAlign: TextAlign.center),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
