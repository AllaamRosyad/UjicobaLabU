// import 'package:flutter/material.dart';
// import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
// import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
// import 'package:t_store/common/widgets/layouts/grid_layout.dart';
// import 'package:t_store/common/widgets/product_cart/product_card_vertical.dart';
// import 'package:t_store/common/widgets/texts/section_heading.dart';
// import 'package:t_store/features/laboratorium/screens/home/widgets/home_appbar.dart';
// import 'package:t_store/features/laboratorium/screens/home/widgets/home_categories.dart';
// import 'package:t_store/features/laboratorium/screens/home/widgets/promo_slider.dart';
// import 'package:t_store/utils/constants/image_strings.dart';
// import 'package:t_store/utils/constants/sizes.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   get children => null;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const TPrimaryHeaderContainer(
//                 child: Column(
//               children: [
//                 /// Appbar tutorial
//                 THomeAppBar(),
//                 SizedBox(height: TSizes.spaceBtwSections),

//                 /// Search Bar
//                 TSearchContainer(text: 'Search in Laboratorium'),
//                 SizedBox(height: TSizes.spaceBtwSections),

//                 /// Categories
//                 Padding(
//                   padding: EdgeInsets.only(left: TSizes.defaultSpace),
//                   child: Column(
//                     children: [
//                       /// Heading
//                       TSectionHeading(
//                           title: 'Popular Categories',
//                           showActionButton: false,
//                           textColor: Colors.white),
//                       SizedBox(height: TSizes.spaceBtwItems),

//                       /// Categories
//                       THomeCategories(),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: TSizes.spaceBtwSections),
//               ],
//             )),

//             /// Body
//             Padding(
//               padding: const EdgeInsets.all(TSizes.defaultSpace),
//               child: Column(
//                 children: [
//                   /// Promo Slider
//                   const TPromoSlider(
//                     banners: [
//                       TImages.promoBanner1,
//                       TImages.promoBanner2,
//                       TImages.promoBanner3
//                     ],
//                   ),
//                   const SizedBox(height: TSizes.spaceBtwSections),

//                   /// Heading
//                   TSectionHeading(
//                     title: 'Popular Products',
//                     onPressed: () {},
//                   ),
//                   const SizedBox(height: TSizes.spaceBtwItems),

//                   /// Popular Product
//                   TGridLayout(
//                       itemCount: 4,
//                       itemBuilder: (_, index) => const TProductCardVertical()),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/product_cart/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/laboratorium/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/laboratorium/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// Search Bar
                  TSearchContainer(text: 'Search in Laboratorium'),
                  SizedBox(height: TSizes.spaceBtwSections * 3),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Promo Slider
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Heading
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Popular Product
                  TGridLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) => const TProductCardVertical()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
