class BussinessLines {
  int id;
  String sertecpetId;
  String label;

  BussinessLines({
    required this.id,
    required this.sertecpetId,
    required this.label,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sertecpet_id': sertecpetId,
      'label': label,
    };
  }
}
