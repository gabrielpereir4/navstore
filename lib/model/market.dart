import 'package:navstore/model/mappable.dart';
import 'package:navstore/model/product.dart';

class Market implements Mappable {
  @override
  int id;
  String name;
  String address;
  String postalcode;
  String telephone;
  List<Product> stock;

  Market(this.id, this.name, this.address, this.postalcode, this.telephone,
      this.stock);

  factory Market.fromMap(Map<String, dynamic> map) {
    return Market(map['id'], map['name'], map['address'], map['postalcode'],
        map['telephone'], map['stock']);
  }

  @override
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
