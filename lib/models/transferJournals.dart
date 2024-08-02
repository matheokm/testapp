import 'package:testapp/models/fuelTypes.dart';
import 'package:testapp/models/users.dart';
import 'package:testapp/models/warehouseLocations.dart';

class Diarios {
  int id;
  Users user;
  FuelTypes fuelType;
  WarehouseLocation warehouseLocationFrom;
  WarehouseLocation warehouseLocationTo;
  String fuelQty;
  int status;
  String description;
  String journalId;
  String createdAt;
  String updatedAt;

  Diarios({
    required this.id,
    required this.user,
    required this.fuelType,
    required this.warehouseLocationFrom,
    required this.warehouseLocationTo,
    required this.fuelQty,
    required this.status,
    required this.description,
    required this.journalId,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user.toMap(),
      'fuel_type': fuelType.toMap(),
      'warehouse_location_from': warehouseLocationFrom.toMap(),
      'warehouse_location_to': warehouseLocationTo.toMap(),
      'fuel_qty': fuelQty,
      'status': status,
      'description': description,
      'journal_id': journalId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
