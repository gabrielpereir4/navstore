class User {
  String name;
  String email;
  String password;

  User(this.name, this.email, this.password);

  factory User.fromMap(Map<String, dynamic> map) {
    return User(map['name'], map['email'], map['password']);
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'password': password};
  }
}
