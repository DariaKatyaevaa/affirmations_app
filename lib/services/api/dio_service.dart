import 'dart:convert';
import 'package:affirmations_app/services/storage/storage_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:affirmations_app/models/api_error/api_error.dart';
import 'package:affirmations_app/providers/services_providers.dart';

enum HttpMethod {
  get,
  post,
  patch,
  delete,
  put,
}

class DioService {
  DioService(this.ref) {
    dio = Dio();

    // dio.interceptors.add(LogInterceptor(
    //   requestBody: true,
    //   responseBody: true,
    // ));
  }

  final ProviderRef ref;
  late final Dio dio;

  Future<T> request<T>({
    required String url,
    required HttpMethod method,
    required T Function(dynamic data) builder,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? passedData,
    String? token,
    bool jsonHeader = true,
    FormData? formData,
    bool setToken = false,
  }) async {
    try {
      dynamic data;
      if (jsonHeader) {
        data = passedData != null ? jsonEncode(passedData) : null;
      } else {
        data = formData;
      }

      final options = jsonHeader
          ? Options(
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                if (token != null) 'Authorization': 'Bearer $token',
              },
              method: method.name,
            )
          : Options(
              headers: {
                'Content-Type': 'multipart/form-data',
                if (token != null) 'Authorization': 'Bearer $token',
              },
              method: method.name,
            );

      final Response response;

      switch (method) {
        case HttpMethod.get:
          response = await dio.get(
            url,
            options: options,
            queryParameters: parameters,
          );
          break;
        case HttpMethod.post:
          response = await dio.post(
            url,
            data: data,
            options: options,
          );
          break;
        case HttpMethod.put:
          response = await dio.put(
            url,
            data: data,
            options: options,
          );
          break;
        case HttpMethod.delete:
          response = await dio.delete(
            url,
            data: data,
            options: options,
          );
          break;
        case HttpMethod.patch:
          response = await dio.patch(
            url,
            data: data,
            options: options,
          );
          break;
        default:
          response = await dio.get(
            url,
            options: options,
          );
          break;
      }

      // Set token as received in header
      if (setToken) {
        final _storageService = ref.read(storageServiceProvider);

        response.headers.forEach((name, values) async {
          if (name == 'Authorization') {
            await _storageService.set(
              key: 'token',
              data: values.first,
              boxName: StorageBoxNames.settingsBox,
            );
          }
        });
      }

      return builder(response.data);
    } on DioException catch (e) {
      try {
        final errorData = e.response?.data as Map<String, dynamic>;

        if (e.message?.contains('Network is unreachable') ?? false) {
          throw ApiError(message: 'No internet connection');
        }

        /// Process status code
        switch (e.response?.statusCode) {
          case 401:
            throw ApiError(message: 'Invalid API Key');
          case 404:
            throw ApiError(message: 'Not found');
          default:
            throw ApiError.fromJson(errorData);
        }
      } on TypeError catch (_) {
        throw ApiError(message: 'Unsuccessfully tried parsing error message.');
      }
    }
  }
}
