import 'package:navstore/model/mappable.dart';

class Product implements Mappable {
  @override
  int? id;
  String name;
  String section;

  Product(this.id, this.name, this.section);

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(map['id'], map['name'], map['section']);
  }

  @override
  Map<String, dynamic> toMap() {
    return {'name': name, 'section': section};
  }
}
