import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:t_store/features/laboratorium/models/product_model.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  /// Variables
  Rx<String> selectedProductImage = ''.obs;

  /// Get All Images from Product
  List<String> getAllProductImages(ProductModel product) {
    Set<String> images = {};

    /// Load thumbnail image
    images.add(product.thumbnail);

    /// Assign Thumbnail as Selected Image
    selectedProductImage.value = product.thumbnail;

    /// Load additional images if available
    if (product.images != null) {
      images.addAll(product.images!);
    }

    return images.toList();
  }
}
