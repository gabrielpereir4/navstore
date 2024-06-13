class Product {
  String name;
  String description;
  double price;
  String code;

  Product(this.name, this.description, this.price, this.code);

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(map['name'], map['description'], map['price'], map['code']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price:': price.toString(),
      'code': code
    };
  }
}
