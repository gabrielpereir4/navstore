import 'package:navstore/provider/generic_provider.dart';

class UserProvider extends GenericProvider {
  static final UserProvider helper = UserProvider._createInstance();
  @override
  String suffix = 'users';

  UserProvider._createInstance();
}
