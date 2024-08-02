class Consumers {
  int id;
  String consumptionProject;
  String description;
  int consumerType;
  String counterLabel;
  String counterUnit;

  Consumers({
    required this.id,
    required this.consumptionProject,
    required this.description,
    required this.consumerType,
    required this.counterLabel,
    required this.counterUnit,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'consumption_project': consumptionProject,
      'description': description,
      'consumer_type': consumerType,
      'counter_label': counterLabel,
      'counter_unit': counterUnit,
    };
  }
}
