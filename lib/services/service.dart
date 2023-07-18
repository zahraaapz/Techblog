import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;
import 'dart:developer';

class DioServices {
     Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
 

    dio.options.headers['Content-Type'] = 'application/json';

    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'Get'))
        .then((value) {
      log(value.toString());
      return value;
    });
  }

  Future<dynamic>postMethod(Map<String,dynamic>map,String url)async{

dio.options.headers['Content-Type'] = 'application/json';

return await dio.post(

  url,data: dio_service.FormData.fromMap(map),options: Options(responseType: ResponseType.json,method: 'POST',)
).then((value){ 
  
  log(value.toString());

return value;

});


  }
}

