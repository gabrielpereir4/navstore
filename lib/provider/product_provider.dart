import 'package:navstore/provider/generic_provider.dart';

class ProductProvider extends GenericProvider {
  static final ProductProvider helper = ProductProvider._createInstance();
  @override
  String suffix = 'products';

  ProductProvider._createInstance();
}
