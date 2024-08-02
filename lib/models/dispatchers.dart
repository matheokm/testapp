class Dispatchers {
  int id;
  String username;

  Dispatchers({
    required this.id,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
    };
  }
}
