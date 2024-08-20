import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/common/widgets/product_cart/product_card_horizontal.dart';
import 'package:t_store/common/widgets/section_heading/section_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Sports shirts'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              TRoundedImage(
                  width: double.infinity,
                  imageUrl: TImages.promoBanner1,
                  applyImageRadius: true),
              SizedBox(height: TSizes.spaceBtwSections),

              /// Sub-Categories
              Column(
                children: [
                  /// Heading
                  TSectionHeading(
                    title: 'Sports shirts',
                    onPressed: () {},
                  ),
                  SizedBox(height: TSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: TSizes.spaceBtwItems),
                        itemBuilder: (context, index) =>
                            TProductCardHorizontal()),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
