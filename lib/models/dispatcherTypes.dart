import 'package:testapp/models/dispatchers.dart';

class DispatcherTypes {
  int id;
  String label;
  String whLocationKey;
  Dispatchers dispatcher;

  DispatcherTypes({
    required this.id,
    required this.label,
    required this.whLocationKey,
    required this.dispatcher,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'wh_location_key': whLocationKey,
      'dispatcher': dispatcher.toMap(),
    };
  }
}
