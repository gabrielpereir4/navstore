import 'dart:async';
import 'package:dio/dio.dart';
import 'package:navstore/model/mappable.dart';

abstract class GenericProvider {
  String url =
      'https://9b256625-6604-4db6-840a-0d08b67496ae-00-2dqr3yjbmxz35.picard.replit.dev/';
  abstract String suffix;
  Dio _dio = Dio();

  Future<bool> insert(dynamic mappable) async {
    try {
      await _dio.post(
        url,
        data: mappable.toMap(),
      );
      return true;
    } catch (error) {
      print("Error inserting into $url/$suffix ($error)");
      return false;
    }
  }

  Future<Mappable> get(int id) async {
    Response response = await _dio.get('$url/$suffix/$id');
    return Mappable.fromMap(response.data);
  }

  Future<bool> update(int id, Mappable mappable) async {
    try {
      await _dio.put(
        '$url/$suffix/$id',
        data: mappable.toMap(),
      );
      return true;
    } catch (error) {
      print("Error updating ID $id in $url/$suffix ($error)");
      return false;
    }
  }

  Future<bool> delete(int id) async {
    try {
      await _dio.delete('$url/$suffix/$id');
      return true;
    } catch (error) {
      print("Error deleting ID $id in $url/$suffix ($error)");
      return false;
    }
  }

  Future<List<Mappable>> getList() async {
    Response response = await _dio.get('$url/$suffix');

    List<Mappable> collection = [];
    response.data.forEach((key, value) {
      Mappable item = Mappable.fromMap(value);
      collection.add(item);
    });
    print('Fetched ${collection.length} objects ($suffix)');
    return collection;
  }
}
