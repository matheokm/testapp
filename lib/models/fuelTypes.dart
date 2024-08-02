class FuelTypes {
  int id;
  String itemCode;
  String description;

  FuelTypes({
    required this.id,
    required this.itemCode,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item_code': itemCode,
      'description': description,
    };
  }
}
