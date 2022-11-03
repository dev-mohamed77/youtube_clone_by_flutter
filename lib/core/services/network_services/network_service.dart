import 'package:dio/dio.dart';

abstract class NetWorkService {
  Future<Response<T>> getData<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    String? token,
  });

  Future<Response<T>> postData<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    dynamic data,
    String? token,
  });

  Future<Response<T>> updateData<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
    String? token,
  });
  Future<Response<T>> deleteData<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
    String? token,
  });
}

class DioService implements NetWorkService {
  late Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.1.7:8800/api/v1",
      receiveDataWhenStatusError: true,
      sendTimeout: 20 * 1000,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    ),
  );

  DioService._();

  factory DioService() => DioService._();

  @override
  Future<Response<T>> getData<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    String? token,
  }) {
    dio.options.headers = {
      "Content-Type": "application/json",
      "Authorization": token,
    };
    return dio.get(
      url,
      queryParameters: queryParams,
    );
  }

  @override
  Future<Response<T>> postData<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    dynamic data,
    String? token,
  }) {
    dio.options.headers = {
      "Content-Type": "application/json",
      "Authorization": token,
    };
    return dio.post(
      url,
      queryParameters: queryParams,
      data: data,
    );
  }

  @override
  Future<Response<T>> updateData<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
    String? token,
  }) {
    dio.options.headers = {
      "Content-Type": "application/json",
      "Authorization": token,
    };
    return dio.put(
      url,
      queryParameters: queryParams,
      data: data,
    );
  }

  @override
  Future<Response<T>> deleteData<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
    String? token,
  }) {
    dio.options.headers = {
      "Content-Type": "application/json",
      "Authorization": token,
    };
    return dio.delete(
      url,
      queryParameters: queryParams,
      data: data,
    );
  }
}
