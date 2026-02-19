class RestauranteMenuModel {
  final int itemID;
  final String itemName;
  final String itemDescription;
  final double itemPrice;
  final String restaurantName;
  final int restaurantID;
  final String imageUrl;

  RestauranteMenuModel({
    required this.itemID,
    required this.itemName,
    required this.itemDescription,
    required this.itemPrice,
    required this.restaurantName,
    required this.restaurantID,
    required this.imageUrl,
  });

 
  factory RestauranteMenuModel.fromJson(Map<String, dynamic> json) {
    return RestauranteMenuModel(
      itemID: json['itemID'],
      itemName: json['itemName'],
      itemDescription: json['itemDescription'],
      itemPrice: (json['itemPrice'] as num).toDouble(),
      restaurantName: json['restaurantName'],
      restaurantID: json['restaurantID'],
      imageUrl: json['imageUrl'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'itemID': itemID,
      'itemName': itemName,
      'itemDescription': itemDescription,
      'itemPrice': itemPrice,
      'restaurantName': restaurantName,
      'restaurantID': restaurantID,
      'imageUrl': imageUrl,
    };
  }
}
