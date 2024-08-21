// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:t_store/common/styles/shadows.dart';
// import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
// import 'package:t_store/common/widgets/images/t_rounded_image.dart';
// import 'package:t_store/common/widgets/texts/product_price_text.dart';
// import 'package:t_store/common/widgets/texts/product_title_text.dart';
// import 'package:t_store/features/laboratorium/screens/home/widgets/rounded_container.dart';
// import 'package:t_store/features/laboratorium/screens/product_details/product_detail.dart';
// import 'package:t_store/utils/constants/colors.dart';
// import 'package:t_store/utils/constants/image_strings.dart';
// import 'package:t_store/utils/constants/sizes.dart';
// import 'package:t_store/utils/helpers/helper_functions.dart';

// class TProductCardVertical extends StatelessWidget {
//   const TProductCardVertical({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);

//     /// Container with side paddings, color, edges, radius and shadow.
//     return GestureDetector(
//       onTap: () => Get.to(() => ProductDetailScreen()),
//       child: Container(
//         width: 180,
//         padding: const EdgeInsets.all(1),
//         decoration: BoxDecoration(
//           boxShadow: [TShadowStyle.verticalProductShadow],
//           borderRadius: BorderRadius.circular(TSizes.productImageRadius),
//           color: dark ? TColors.darkerGrey : TColors.white,
//         ),
//         child: Column(
//           children: [
//             /// Thumbnail, Wishlist Button, Discount Tag
//             TRoundedContainer(
//                 height: 180,
//                 padding: const EdgeInsets.all(TSizes.sm),
//                 backgroundColor: dark ? TColors.dark : TColors.light,
//                 child: Stack(
//                   children: [
//                     /// Thumbnail Image
//                     const TRoundedImage(
//                         imageUrl: TImages.productImage1,
//                         applyImageRadius: true),

//                     /// Sale Tag
//                     Positioned(
//                       top: 12,
//                       child: TRoundedContainer(
//                         radius: TSizes.sm,
//                         backgroundColor: TColors.secondary.withOpacity(0.8),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: TSizes.sm, vertical: TSizes.xs),
//                         child: Text('25%',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .labelLarge!
//                                 .apply(color: TColors.black)),
//                       ),
//                     ),

//                     /// Favorite Icon Button
//                     const Positioned(
//                         top: 0,
//                         right: 0,
//                         child: TCircularIcon(
//                             icon: Iconsax.heart5, color: Colors.red)),
//                   ],
//                 )),
//             const SizedBox(height: TSizes.spaceBtwItems / 2),

//             /// Details
//             const Padding(
//               padding: EdgeInsets.only(left: TSizes.sm),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TProductTitleText(
//                       title: 'Greeen Nike Air Shoes', smallSize: true),
//                   SizedBox(height: TSizes.spaceBtwItems / 2),
//                 ],
//               ),
//             ),

//             /// Todo: Add Spacer() here to keep the height of each Box same in case 1 or 2 lines of Headings
//             const Spacer(),

//             /// Price Row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 /// Price
//                 const Padding(
//                   padding: EdgeInsets.only(left: TSizes.sm),
//                   child: TProductPriceText(price: '35.0'),
//                 ),

//                 /// Add to Cart Button
//                 Container(
//                   decoration: const BoxDecoration(
//                       color: TColors.dark,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(TSizes.cardRadiusMd),
//                         bottomRight: Radius.circular(TSizes.productImageRadius),
//                       )),
//                   child: const SizedBox(
//                     width: TSizes.iconLg * 1.2,
//                     height: TSizes.iconLg * 1.2,
//                     child: Center(
//                       child: Icon(Iconsax.add, color: TColors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/shadows.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/common/widgets/product_cart/add_to_cart_button.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/features/laboratorium/models/product_model.dart';
import 'package:t_store/features/laboratorium/screens/home/widgets/rounded_container.dart';
import 'package:t_store/features/laboratorium/screens/product_details/product_detail.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: TRoundedImage(
                imageUrl: product.thumbnail,
                applyImageRadius: true,
                isNetworkImage: true,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// Product Title
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                ],
              ),
            ),

            const Spacer(),

            /// Stock Quantity Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Stock Information (Replaced Price)
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: Text(
                    'Stock: ${product.stock} items', // Use the stock from the product model
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),

                /// Add to Cart Button
                ProductCardAddToCartButton(product: product),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
