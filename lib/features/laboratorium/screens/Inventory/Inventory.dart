import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/product_cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/product_cart/product_card_vertical.dart';
import 'package:t_store/features/laboratorium/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  late Future<List<ProductModel>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts =
        _fetchProducts(); // Fetch products when the widget initializes
  }

  Future<List<ProductModel>> _fetchProducts() async {
    try {
      print('Fetching products from Firestore...');
      final snapshot =
          await FirebaseFirestore.instance.collection('Products').get();
      print('Products fetched: ${snapshot.docs.length}');
      return snapshot.docs.map((doc) {
        print('Document data: ${doc.data()}');
        return ProductModel.fromSnapshot(doc);
      }).toList();
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Inventory',
            style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCartCounterIcon(onPressed: () {}),
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products found'));
          } else {
            final products = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TSearchContainer(
                      text: 'Search Products',
                      showBorder: true,
                      showBackground: true,
                      padding: EdgeInsets.symmetric(
                          vertical: TSizes.sm, horizontal: TSizes.md),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    // Heading
                    Text('All Products',
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Grid Layout of Products
                    TGridLayout(
                      itemCount: products.length,
                      itemBuilder: (_, index) {
                        final product = products[index];
                        print("Product at index $index: ${product.toJson()}");
                        return TProductCardVertical(product: product);
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
