// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:readmore/readmore.dart';
// import 'package:t_store/common/widgets/appbar/appbar.dart';
// import 'package:t_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
// import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
// import 'package:t_store/common/widgets/section_heading/section_heading.dart';
// import 'package:t_store/features/laboratorium/screens/product_details/widgets/bottom_add_to_cart.dart';
// import 'package:t_store/features/laboratorium/screens/product_details/widgets/product_data.dart';
// import 'package:t_store/features/laboratorium/screens/product_details/widgets/product_image.dart';
// import 'package:t_store/utils/constants/colors.dart';
// import 'package:t_store/utils/constants/image_strings.dart';
// import 'package:t_store/utils/constants/sizes.dart';
// import 'package:t_store/utils/helpers/helper_functions.dart';

// class ProductDetailScreen extends StatelessWidget {
//   const ProductDetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     return Scaffold(
//       bottomNavigationBar: TBottomAddToCart(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             /// Product Image
//             TProductImage(),

//             /// Product Details
//             Padding(
//               padding: EdgeInsets.only(
//                   right: TSizes.defaultSpace,
//                   left: TSizes.defaultSpace,
//                   bottom: TSizes.defaultSpace),
//               child: Column(
//                 children: [
//                   /// Product Data
//                   TProductData(),
//                   Divider(),
//                   SizedBox(height: TSizes.spaceBtwItems / 2),

//                   /// Description
//                   TSectionHeading(
//                       title: 'Description', showActionButton: false),
//                   SizedBox(height: TSizes.spaceBtwItems),
//                   ReadMoreText(
//                     'This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but i am just practicing and nothing else.',
//                     trimLines: 2,
//                     trimMode: TrimMode.Line,
//                     trimCollapsedText: 'Show more',
//                     trimExpandedText: '   Less',
//                     moreStyle:
//                         TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
//                     lessStyle:
//                         TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
//                   ),
//                   SizedBox(height: TSizes.spaceBtwSections),

//                   // /// Checkout Button
//                   // SizedBox(
//                   //   width: double.infinity,
//                   //   child: ElevatedButton(
//                   //       onPressed: () {}, child: Text('Checkout')),
//                   // ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/section_heading/section_heading.dart';
import 'package:t_store/features/laboratorium/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:t_store/features/laboratorium/screens/product_details/widgets/product_data.dart';
import 'package:t_store/features/laboratorium/screens/product_details/widgets/product_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text('Product Details'),
        actions: [
          IconButton(
            icon: Icon(Iconsax.heart),
            onPressed: () {
              // Add to wishlist
            },
          ),
          IconButton(
            icon: Icon(Iconsax.share),
            onPressed: () {
              // Share product
            },
          ),
        ],
      ),
      bottomNavigationBar: TBottomAddToCart(
          // onAddToCart: () {
          //   // Add to cart logic
          // },
          // onBuyNow: () {
          //   // Buy now logic
          // },
          ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Product Image
            Stack(
              children: [
                TProductImage(),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                      //   child: TCircularIcon(
                      //     icon: Iconsax.eye,
                      //     onPressed: () {
                      //       // View product in AR or zoom in
                      //     },
                      //   ),
                      ),
                ),
              ],
            ),

            /// Product Details
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Product Data
                  TProductData(),
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// Price Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp 150,000',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: dark ? TColors.white : TColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Row(
                        children: [
                          Icon(Iconsax.discount_shape, color: TColors.primary),
                          SizedBox(width: 4),
                          Text(
                            '10% OFF',
                            style: TextStyle(
                              color: TColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// Description
                  TSectionHeading(
                      title: 'Description', showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    'This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but I am just practicing and nothing else.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: '   Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// Seller Information
                  TSectionHeading(
                      title: 'Seller Information', showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(TImages.toyIcon),
                    ),
                    title: Text('Official Nike Store'),
                    subtitle: Text('Online • 98% positive feedback'),
                    trailing: Icon(Iconsax.arrow_right_3),
                    onTap: () {
                      // Go to store page
                    },
                  ),
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// Reviews Section
                  TSectionHeading(title: 'Reviews', showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: Icon(Iconsax.star, color: TColors.primary),
                    title: Text('4.8 out of 5'),
                    subtitle: Text('200 reviews'),
                    trailing: Icon(Iconsax.arrow_right_3),
                    onTap: () {
                      // Go to reviews page
                    },
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
