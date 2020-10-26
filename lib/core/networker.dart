import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nebula/utils/constants.dart';

class Networker {
  Dio _dio;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Networker() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Constants.endpoint,
        contentType: "application/json",
        headers: {
          'Accept': 'application/json',
          'Content-Type': "application/json",
        },
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioError error) {
          /// Handle API errors here
        },
        onRequest: (RequestOptions options) async {
          /// Inject headers or dynamic params to your query here
        },
      ),
    );
  }

  Future post(route, {params}) {
    return _dio.post(route, data: params);
  }

  Future put(route, {params}) {
    return _dio.put(route, data: params);
  }

  Future get(route) {
    return _dio.get(route);
  }

  Future delete(route) {
    return _dio.delete(route);
  }
}

final Networker worker = Networker();
