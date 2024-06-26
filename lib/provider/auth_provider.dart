import 'package:dio/dio.dart';
import 'package:navstore/model/user.dart';

class AuthProvider {
  static final AuthProvider helper = AuthProvider._createInstance();
  final String endpoint =
      'https://9b256625-6604-4db6-840a-0d08b67496ae-00-2dqr3yjbmxz35.picard.replit.dev/users';

  AuthProvider._createInstance();
  final Dio _dio = Dio();

  // register
  Future<User> registerUser(User user) async {
    try {
      print(user.toMap());
      Response response = await _dio.post(
        'https://9b256625-6604-4db6-840a-0d08b67496ae-00-2dqr3yjbmxz35.picard.replit.dev/users/register',
        data: user.toMap(),
      );
      if (response.statusCode == 200) {
        return user;
      } else {
        print(response.statusCode);
        print(response);
        throw Exception(response.data);
      }
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<User?> loginUser(String email, String password) async {
    try {
      print("Login do USER $email");
      Response response = await _dio.post('$endpoint/login',
          data: {"email": email, "password": password});
      print(response.data);
      if (response.statusCode == 200) {
        return User.fromMap(response.data);
      } else {
        print('Erro de Login');
        return null;
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
  // logout
}
