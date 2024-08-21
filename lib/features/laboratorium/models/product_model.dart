import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String id;
  String title;
  int stock;
  String thumbnail;
  String? description;
  List<String>? images;
  bool? isFeatured;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.thumbnail,
    this.images,
    this.description,
    this.isFeatured,
  });

  /// Create Empty func for clean code
  static ProductModel empty() => ProductModel(
      id: '', title: 'No Title', stock: 0, thumbnail: 'No Thumbnail');

  /// Json Format
  toJson() {
    return {
      'Title': title,
      'Stock': stock,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'IsFeatured': isFeatured ?? false,
      'Description': description ?? 'No Description',
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;

    // Menangani 'Images' yang seharusnya List<String> tapi bisa saja string tunggal
    List<String> imagesList = [];
    if (data['Images'] is String) {
      imagesList = [data['Images'] as String];
    } else if (data['Images'] is List) {
      imagesList = List<String>.from(data['Images']);
    }

    // Mengambil 'stock' sebagai int, jika sesuai dengan tipe yang ada di Firestore
    int stock = 0;
    if (data['Stock'] is int) {
      stock = data['Stock'];
    }

    return ProductModel(
      id: document.id,
      title: data['Title'] ?? 'No Title',
      stock: stock,
      isFeatured: data['IsFeatured'] ?? false,
      thumbnail: data['Thumbnail'] ?? 'No Thumbnail',
      description: data['Description'] ?? 'No Description',
      images: imagesList,
    );
  }
}
