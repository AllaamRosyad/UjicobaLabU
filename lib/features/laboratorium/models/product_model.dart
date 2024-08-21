import 'package:cloud_firestore/cloud_firestore.dart';

enum ProductType {
  single,
  variable,
  // Add other product types if needed
}

class ProductModel {
  String id;
  String title;
  int stock;
  String thumbnail;
  String? description;
  List<String>? images;
  bool? isFeatured;
  ProductType productType;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.thumbnail,
    this.images,
    this.description,
    this.isFeatured,
    required this.productType,
  });

  static ProductModel empty() => ProductModel(
        id: '',
        title: 'No Title',
        stock: 0,
        thumbnail: 'No Thumbnail',
        productType: ProductType.single, // Provide a default productType
      );

  toJson() {
    return {
      'Title': title,
      'Stock': stock,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'IsFeatured': isFeatured ?? false,
      'Description': description ?? 'No Description',
      'ProductType': productType.toString().split('.').last, // Store as string
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;

    List<String> imagesList = [];
    if (data['Images'] is String) {
      imagesList = [data['Images'] as String];
    } else if (data['Images'] is List) {
      imagesList = List<String>.from(data['Images']);
    }

    int stock = 0;
    if (data['Stock'] is int) {
      stock = data['Stock'];
    }

    // Safely parse ProductType from the snapshot
    ProductType productType;
    if (data['ProductType'] != null && data['ProductType'] is String) {
      productType = ProductType.values.firstWhere(
        (e) => e.toString().split('.').last == data['ProductType'],
        orElse: () => ProductType.single, // Default value
      );
    } else {
      productType = ProductType.single; // Default value if not provided
    }

    return ProductModel(
      id: document.id,
      title: data['Title'] ?? 'No Title',
      stock: stock,
      isFeatured: data['IsFeatured'] ?? false,
      thumbnail: data['Thumbnail'] ?? 'No Thumbnail',
      description: data['Description'] ?? 'No Description',
      images: imagesList,
      productType: productType,
    );
  }
}
