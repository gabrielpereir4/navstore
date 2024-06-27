import 'package:navstore/model/mappable.dart';

class User implements Mappable {
  @override
  int? id;
  String name;
  String email;
  String password;
  String address;
  String postalcode;
  bool admin;

  User(this.id, this.name, this.email, this.password, this.address,
      this.postalcode, this.admin);

  factory User.fromMap(Map<String, dynamic> map) {
    return User(map['id'], map['name'], map['email'], map['password'],
        map['address'], map['postalCode'], map['admin']);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'postalCode': postalcode,
      'admin': admin
    };
  }
}
