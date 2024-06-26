import 'package:socket_io_client/socket_io_client.dart';
import 'package:navstore/model/market.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class MarketProvider {
  static final MarketProvider helper = MarketProvider._createInstance();
  String url =
      'https://9b256625-6604-4db6-840a-0d08b67496ae-00-2dqr3yjbmxz35.picard.replit.dev';
  String suffix = 'markets';

  MarketProvider._createInstance();

  Dio _dio = Dio();

  Future<bool> insert(Market market) async {
    try {
      print("Inserting ${market.name} into $url/$suffix");
      await _dio.post(
        url,
        data: market.toMap(),
      );
      return true;
    } catch (error) {
      print("Error inserting into $url/$suffix ($error)");
      return false;
    }
  }

  Future<Market> get(int id) async {
    Response response = await _dio.get('$url/$suffix/$id');
    return Market.fromMap(response.data);
  }

  Future<bool> update(int id, Market market) async {
    try {
      print("Updating ID $id in $url/$suffix");
      await _dio.put(
        '$url/$suffix/$id',
        data: market.toMap(),
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

  Future<List<Market>> getList() async {
    try {
      print("Fetching MARKET list");
      Response response = await _dio.get('$url$suffix');
      List<Market> collection = [];
      response.data.forEach((key, value) {
        Market item = Market.fromMap(value);
        collection.add(item);
      });
      print('Fetched ${collection.length} objects ($suffix)');
      return collection;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  final StreamController<List<Market>> _controller = StreamController();

  Stream<List<Market>> get stream {
    Socket socket = io(
      "https://9b256625-6604-4db6-840a-0d08b67496ae-00-2dqr3yjbmxz35.picard.replit.dev/$suffix",
      OptionBuilder().setTransports(['websocket']).build(),
    );

    socket.on('server_information', (data) async {
      print('Received update from server');
      final List<Market> updatedList = await getList() as List<Market>;
      _controller.sink.add(updatedList);
    });
    return _controller.stream;
  }
}
