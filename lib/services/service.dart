import 'package:dio/dio.dart';
import 'dart:developer';

class DioServices {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();

    dio.options.headers['Content-Type'] = 'application/json';

    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'Get'))
        .then((value) {
      log(value.toString());
      return value;
    });
  }
}
