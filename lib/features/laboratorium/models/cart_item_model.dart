class CartItemModel {
  String productId;
  String title;
  String? image;
  int quantity;

  /// Constructor
  CartItemModel({
    required this.productId,
    required this.quantity,
    this.image,
    this.title = '',
  });

  /// Empty Cart
  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  /// Convert a CartItem to a Json Map
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'image': image,
      'quantity': quantity,
    };
  }

  /// Create a CartItem from a JSON Map
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
        productId: json['productId'],
        title: json['title'],
        image: json['image'],
        quantity: json['quantity']);
  }
}
