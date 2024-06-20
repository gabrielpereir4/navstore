import 'package:navstore/model/mappable.dart';

class Product implements Mappable {
  @override
  int id;
  String name;
  String description;
  double price;
  String code;

  Product(this.id, this.name, this.description, this.price, this.code);

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        map['id'], map['name'], map['description'], map['price'], map['code']);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price:': price.toString(),
      'code': code
    };
  }
}
