
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/component/storage_const.dart';
import 'package:tech_blog/register/register.dart';
import 'package:tech_blog/services/service.dart';
import 'package:tech_blog/view/ExractHomeScreen.dart';


class RegisterController extends GetxController{

TextEditingController emailTextEditingController=TextEditingController();
TextEditingController activeTextEditingController=TextEditingController();
 var email='';
 var  userId='';

register()  async{
Map<String,dynamic>map={
  'email':emailTextEditingController.text,
  'command':'register'
};

  var response=  await  DioServices().postMethod(map, '${ApiCons.baseUrl}register/action.php');
  email=emailTextEditingController.text;
  userId=response.data['user_id'];
  debugPrint(map.toString());
}


verify()  async{
Map<String,dynamic>map={
  'email':email,
  'user_id':userId,
  'code':activeTextEditingController.text,
  'command':'verify',
};
 debugPrint(map.toString());


  var response=  await  DioServices().postMethod(map,'${ApiCons.baseUrl}register/action.php');

  debugPrint(response.data.toString());
  var status=response.data['response'];

 switch (status){

 case 'verified':
 var box=GetStorage();
 box.write(token, response.data['token']);
 box.write(userId, response.data['user_id']);

  // ignore: prefer_interpolation_to_compose_strings
  debugPrint('read::: '+ box.read(token));

  // ignore: prefer_interpolation_to_compose_strings
  debugPrint('read::: '+ box.read(userId));
Get.offAll(MainScreen());
break;
 case 'incorrect_code':
 Get.snackbar('خطا', 'کد صحیح نیست');
 break;
 case 'expired':
  Get.snackbar('خطا', 'کد منقضی شده است');
 break;

 }


}

toggleLogin(){

if(GetStorage().read(token)==null){


  Get.to(Register());
}else{
  debugPrint('error');
}


}
 
}