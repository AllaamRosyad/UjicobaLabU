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
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/section_heading/section_heading.dart';
import 'package:t_store/features/laboratorium/controllers/images_controller.dart';
import 'package:t_store/features/laboratorium/models/product_model.dart';
import 'package:t_store/features/laboratorium/screens/iot/led_controller.dart';
import 'package:t_store/features/laboratorium/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:t_store/features/laboratorium/screens/product_details/widgets/product_data.dart';
import 'package:t_store/features/laboratorium/screens/product_details/widgets/product_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final LedController _ledController = LedController();
  bool _ledStatus = false;

  @override
  void initState() {
    super.initState();
    _ledController.getLedStatus((status) {
      setState(() {
        _ledStatus = status;
      });
    });
  }

  void _toggleLed(bool value) {
    _ledController.toggleLed(value, (status) {
      setState(() {
        _ledStatus = status;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(widget.product);
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image
            TProductImage(
              product: widget.product, // Correct way to access the product
            ),

            /// Product Details
            Padding(
              padding: EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Product Data with Stock Information
                  TProductData(product: widget.product),

                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems / 2),

                  /// Description Section
                  TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    widget.product.description ??
                        'This is a Product description for the item. More details can be added.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: '   Less',
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// Cek Lokasi Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cek Lokasi',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Switch(
                        value: _ledStatus,
                        onChanged: _toggleLed,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
