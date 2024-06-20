abstract class Mappable {
  abstract int id;
  factory Mappable.fromMap(Map<String, dynamic> map) =>
      throw UnimplementedError();

  Map<String, dynamic> toMap();
}
