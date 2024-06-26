import 'package:socket_io_client/socket_io_client.dart';
import 'package:navstore/model/user.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class UserProvider {
  static final UserProvider helper = UserProvider._createInstance();
  String url =
      'https://9b256625-6604-4db6-840a-0d08b67496ae-00-2dqr3yjbmxz35.picard.replit.dev';
  String suffix = 'users';

  UserProvider._createInstance();

  Dio _dio = Dio();

  Future<bool> insert(User user) async {
    try {
      print("Inserting ${user.name} into $url/$suffix");
      await _dio.post(
        url,
        data: user.toMap(),
      );
      return true;
    } catch (error) {
      print("Error inserting into $url/$suffix ($error)");
      return false;
    }
  }

  Future<User> get(int id) async {
    Response response = await _dio.get('$url/$suffix/$id');
    return User.fromMap(response.data);
  }

  Future<bool> update(int id, User user) async {
    try {
      print("Updating ID $id in $url/$suffix");
      await _dio.put(
        '$url/$suffix/$id',
        data: user.toMap(),
      );
      return true;
    } catch (error) {
      print("Error updating ID $id in $url/$suffix ($error)");
      return false;
    }
  }

  Future<bool> delete(int id) async {
    try {
      print("Deleting ID $id in $url/$suffix");
      await _dio.delete('$url/$suffix/$id');
      return true;
    } catch (error) {
      print("Error deleting ID $id in $url/$suffix ($error)");
      return false;
    }
  }

  Future<List<User>> getList() async {
    try {
      print("Fetching USER list");
      Response response = await _dio.get('$url$suffix');
      List<User> collection = [];
      response.data.forEach((key, value) {
        User item = User.fromMap(value);
        collection.add(item);
      });
      print('Fetched ${collection.length} objects ($suffix)');
      return collection;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  final StreamController<List<User>> _controller = StreamController();

  Stream<List<User>> get stream {
    Socket socket = io(
      "https://9b256625-6604-4db6-840a-0d08b67496ae-00-2dqr3yjbmxz35.picard.replit.dev/$suffix",
      OptionBuilder().setTransports(['websocket']).build(),
    );

    socket.on('server_information', (data) async {
      print('Received update from server');
      final List<User> updatedList = await getList() as List<User>;
      _controller.sink.add(updatedList);
    });
    return _controller.stream;
  }
}
