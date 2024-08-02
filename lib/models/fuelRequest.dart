import 'package:testapp/models/approvals.dart';
import 'package:testapp/models/consumers.dart';
import 'package:testapp/models/costCenters.dart';
import 'package:testapp/models/dispatcherTypes.dart';
import 'package:testapp/models/dispatchers.dart';
import 'package:testapp/models/fuelTypes.dart';
import 'package:testapp/models/users.dart';
import 'package:testapp/models/warehouseLocations.dart';

class Solicitud {
  int id;
  Users customer;
  Approvals approval;
  Consumers consumer;
  CostCenters costCenter;
  FuelTypes fuelType;
  DispatcherTypes dispatcherType;
  Dispatchers dispatcher;
  WarehouseLocation warehouseLocation;
  String counterImage;
  String requestedQty;
  String deliveredQty;
  int counter;
  String location;
  String deliveryCode;
  int journalId;
  String notes;
  int status;
  bool rejected;
  DateTime createdAt;
  DateTime updatedAt;

  Solicitud({
    required this.id,
    required this.customer,
    required this.approval,
    required this.consumer,
    required this.costCenter,
    required this.fuelType,
    required this.dispatcherType,
    required this.dispatcher,
    required this.warehouseLocation,
    required this.counterImage,
    required this.requestedQty,
    required this.deliveredQty,
    required this.counter,
    required this.location,
    required this.deliveryCode,
    required this.journalId,
    required this.notes,
    required this.status,
    required this.rejected,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customer': customer.toMap(),
      'approval': approval.toMap(),
      'consumer': consumer.toMap(),
      'cost_center': costCenter.toMap(),
      'fuel_type': fuelType.toMap(),
      'dispatcher_type': dispatcherType.toMap(),
      'dispatcher': dispatcher.toMap(),
      'warehouse_location': warehouseLocation.toMap(),
      'counter_image': counterImage,
      'requested_qty': requestedQty,
      'delivered_qty': deliveredQty,
      'counter': counter,
      'location': location,
      'delivery_code': deliveryCode,
      'journal_id': journalId,
      'notes': notes,
      'status': status,
      'rejected': rejected,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
