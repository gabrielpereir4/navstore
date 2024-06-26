import 'package:socket_io_client/socket_io_client.dart';
import 'package:navstore/model/product.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class ProductProvider {
  static final ProductProvider helper = ProductProvider._createInstance();
  String url =
      'https://9b256625-6604-4db6-840a-0d08b67496ae-00-2dqr3yjbmxz35.picard.replit.dev';
  String suffix = 'products';

  Dio _dio = Dio();

  Future<bool> insert(Product product) async {
    try {
      print("Inserting ${product.name} into $url/$suffix");
      await _dio.post(
        url,
        data: product.toMap(),
      );
      return true;
    } catch (error) {
      print("Error inserting into $url/$suffix ($error)");
      return false;
    }
  }

  Future<Product> get(int id) async {
    Response response = await _dio.get('$url/$suffix/$id');
    return Product.fromMap(response.data);
  }

  Future<bool> update(int id, Product product) async {
    try {
      print("Updating ID $id in $url/$suffix");
      await _dio.put(
        '$url/$suffix/$id',
        data: product.toMap(),
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

  Future<List<Product>> getList() async {
    try {
      print("Fetching PRODUCT list");
      Response response = await _dio.get('$url$suffix');
      List<Product> collection = [];
      response.data.forEach((key, value) {
        Product item = Product.fromMap(value);
        collection.add(item);
      });
      print('Fetched ${collection.length} objects ($suffix)');
      return collection;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  ProductProvider._createInstance();

  final StreamController<List<Product>> _controller = StreamController();

  Stream<List<Product>> get stream {
    Socket socket = io(
      "https://9b256625-6604-4db6-840a-0d08b67496ae-00-2dqr3yjbmxz35.picard.replit.dev/$suffix",
      OptionBuilder().setTransports(['websocket']).build(),
    );

    socket.on('server_information', (data) async {
      print('Received update from server');
      final List<Product> updatedList = await getList() as List<Product>;
      _controller.sink.add(updatedList);
    });
    return _controller.stream;
  }
}
