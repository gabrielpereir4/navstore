import 'package:navstore/model/product.dart';

class Market {
  String name;
  String address;
  String postalcode;
  String telephone;
  List<Product> stock;

  Market(this.name, this.address, this.postalcode, this.telephone, this.stock);

  factory Market.fromMap(Map<String, dynamic> map) {
    return Market(map['name'], map['address'], map['postalcode'],
        map['telephone'], map['stock']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'postalcode': postalcode,
      'telephone': telephone,
      'stock': stock
    };
  }
}
