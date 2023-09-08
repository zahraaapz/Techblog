import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/component/constant/storage_const.dart';

class DioServices {
     Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
  return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'Get'
            ))
        .then((value) {
      log(value.toString());
      return value;
    }).catchError((e){
      if (e is DioError) {
        return e.response!;
      }
    });
  }

Future<dynamic>postMethod(Map<String,dynamic>map,String url)async{
var token=GetStorage().read(StorageKey.token);

if (token!=null) {

dio.options.headers['authorization'] = '$token';}

return await dio.post(

  url,data: dio_service.FormData.fromMap(map),options: Options(responseType: ResponseType.json,method: 'POST',)
).then((value){ 
  
  log(value.toString());

return value;

}).catchError((e){


  if (e is DioError) {
    return e.response!;
  }
});


  }
}

