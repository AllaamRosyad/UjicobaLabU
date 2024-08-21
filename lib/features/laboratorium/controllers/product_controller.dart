import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/laboratorium/models/product_model.dart';
import 'package:t_store/utils/loaders/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      /// Show loader while loading Products
      isLoading.value = true;

      /// Fetch Products
      final products = await productRepository.getFeaturedProducts();

      /// Assign Products
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Check Product Stock Status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
