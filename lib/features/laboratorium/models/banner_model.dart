import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      imageUrl: data['imageUrl'] ?? '', // Sesuaikan dengan field di Firestore
      targetScreen:
          data['TargetScreen'] ?? '', // Sesuaikan dengan field di Firestore
      active: data['Active'] ?? false, // Sesuaikan dengan field di Firestore
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'TargetScreen': targetScreen,
      'Active': active,
    };
  }
}
