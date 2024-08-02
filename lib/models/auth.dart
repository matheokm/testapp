class Auth {
  String username;
  String password;

  Auth({
    required this.password,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return {'username': username, 'password': password};
  }
}
