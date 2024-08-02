class Clients {
  int id;
  String username;

  Clients({
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
