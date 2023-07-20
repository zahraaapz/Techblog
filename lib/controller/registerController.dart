import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/component/storage_const.dart';
import 'package:tech_blog/services/service.dart';


class RegisterController extends GetxController{

TextEditingController emailTextEditingController=TextEditingController();
TextEditingController activeTextEditingController=TextEditingController();
 var email='';
 var  user_id='';

register()  async{
Map<String,dynamic>map={
  'email':emailTextEditingController.text,
  'command':'register'
};

  var response=  await  DioServices().postMethod(map, '${ApiCons.baseUrl}register/action.php');
  email=emailTextEditingController.text;
  user_id=response.data['user_id'];
  print(response);
}


verify()async{
Map<String,dynamic>map={
  'email':email,
  'user_id':user_id,
  'code':activeTextEditingController.text,
  'command':'verify',
};

  var response=  await  DioServices().postMethod(map, '${ApiCons.baseUrl}register/action.php');
print(response);

if (response.data=='verified') {
  var box=GetStorage();
 box.write(token, response.data['token']);
 box.write(user_id, response.data['user_id']);


 print('read::: '+box.read(token));
 print('read::: '+box.read(user_id));

 
}else{
  log('error');
}
}


 
}