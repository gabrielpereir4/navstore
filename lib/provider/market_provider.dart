import 'package:navstore/provider/generic_provider.dart';

class MarketProvider extends GenericProvider {
  static final MarketProvider helper = MarketProvider._createInstance();
  @override
  String suffix = 'markets';

  MarketProvider._createInstance();
}
