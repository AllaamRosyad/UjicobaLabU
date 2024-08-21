import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brand/brand_show_case.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/product_cart/product_card_vertical.dart';
import 'package:t_store/common/widgets/section_heading/section_heading.dart';
import 'package:t_store/features/laboratorium/models/category_model.dart';
import 'package:t_store/features/laboratorium/models/product_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Brands
                TbrandShowcase(images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage4
                ]),
                SizedBox(height: TSizes.spaceBtwItems),

                /// Products
                TSectionHeading(
                    title: 'You might like',
                    showActionButton: true,
                    onPressed: () {}),
                SizedBox(height: TSizes.spaceBtwItems),

                TGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => TProductCardVertical(
                          product: ProductModel.empty(),
                        ))
              ],
            ),
          ),
        ]);
  }
}
