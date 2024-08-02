class Users {
  int id;
  String username;

  Users({
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
