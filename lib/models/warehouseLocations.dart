class WarehouseLocation {
  int id;
  String wMsLocationId;
  String inventLocationName;

  WarehouseLocation({
    required this.id,
    required this.wMsLocationId,
    required this.inventLocationName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'w_ms_location_id': wMsLocationId,
      'invent_location_name': inventLocationName,
    };
  }
}
