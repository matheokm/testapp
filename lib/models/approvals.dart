class Approvals {
  int id;
  bool supervisor;
  bool warehouse;
  bool dispatcher;
  bool customer;

  Approvals({
    required this.id,
    required this.supervisor,
    required this.warehouse,
    required this.dispatcher,
    required this.customer,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'supervisor': supervisor,
      'warehouse': warehouse,
      'dispatcher': dispatcher,
      'customer': customer,
    };
  }
}
