class RestaurantModel {
  final int restaurantID;
  final String restaurantName;
  final String address;
  final String type;
  final bool parkingLot;

  RestaurantModel({
    required this.restaurantID,
    required this.restaurantName,
    required this.address,
    required this.type,
    required this.parkingLot,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      restaurantID: json['restaurantID'] as int,
      restaurantName: json['restaurantName'] as String,
      address: json['address'] as String,
      type: json['type'] as String,
      parkingLot: json['parkingLot'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'restaurantID': restaurantID,
      'restaurantName': restaurantName,
      'address': address,
      'type': type,
      'parkingLot': parkingLot,
    };
  }

 
}
