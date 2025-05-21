import 'package:dio/dio.dart';
import 'package:store_app/data/interfaces/serializable.dart';

class ApiClient {
  late final Dio dio = Dio(
    BaseOptions(baseUrl: "http://192.168.9.52:8888/api/v1", validateStatus: (value) => true),
  );

  Future<T> genericGetRequest<T>(String path, {Map<String, dynamic>? queryParams}) async {
    final response = await dio.get(path, queryParameters: queryParams);
    if (response.statusCode == 200) {
      return response.data as T;
    } else {
      throw Exception(
        "GET: $path, ${queryParams.toString()} - ${response.statusCode}: ${response.data}",
      );
    }
  }

  Future<T> genericPostRequest<T>(
    String path, {
    required IJsonSerializable? data,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await dio.post(path, data: data?.toJson());
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data as T;
    } else {
      throw Exception("POST: $path, ${data?.toJson()} - ${response.statusCode}: ${response.data}");
    }
  }
}
