import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/appbar/tabbar.dart';
import 'package:t_store/common/widgets/brand/brand_card.dart';
import 'package:t_store/common/widgets/brand/brand_show_case.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/product_cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:t_store/features/laboratorium/controllers/category_controller.dart';
import 'package:t_store/features/laboratorium/screens/Inventory/widgets/category_tab.dart';
import 'package:t_store/features/laboratorium/screens/home/widgets/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class Inventory extends StatelessWidget {
  const Inventory({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(

          /// Appbar
          appBar: TAppBar(
            title: Text('Inventory',
                style: Theme.of(context).textTheme.headlineMedium),
            actions: [
              TCartCounterIcon(onPressed: () {}),
            ],
          ),
          body: NestedScrollView(

              /// Header
              headerSliverBuilder: (_, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          /// Search Bar
                          const SizedBox(height: TSizes.spaceBtwItems),
                          const TSearchContainer(
                              text: '',
                              showBorder: true,
                              showBackground: false,
                              padding: EdgeInsets.zero),
                          const SizedBox(height: TSizes.spaceBtwSections),

                          /// Featured Brand
                          TSectionHeading(
                              title: 'Featured Brands', onPressed: () {}),
                          const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                          /// Brands Grid
                          TGridLayout(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return TBrandCard(showBorder: false);
                              }),
                        ],
                      ),
                    ),

                    /// Tabs
                    bottom: TTabBar(
                        tabs: categories
                            .map((category) => Tab(child: Text(category.name)))
                            .toList()),
                  ),
                ];
              },
              body: TabBarView(
                  children: categories
                      .map((category) => TCategoryTab(category: category))
                      .toList()))),
    );
  }
}
