import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/component/constant/api_constant.dart';
import 'package:tech_blog/component/constant/storage_const.dart';
import 'package:tech_blog/component/constant/string.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/main.dart';
import 'package:tech_blog/register/register.dart';
import 'package:tech_blog/services/service.dart';
import 'package:tech_blog/view/ExractHomeScreen.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activeTextEditingController = TextEditingController();
  var email = '';
  var userId = '';

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };

    var response = await DioServices() .postMethod(map, '${ApiCons.baseUrl}register/action.php');
    email = emailTextEditingController.text;
    userId = response.data['user_id'];
    debugPrint(map.toString());
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activeTextEditingController.text,
      'command': 'verify',
    };
    debugPrint(map.toString());

    var response = await DioServices()
        .postMethod(map, '${ApiCons.baseUrl}register/action.php');

    debugPrint(response.data.toString());
    var status = response.data['response'];
     var box = GetStorage();
   box.write(StorageKey.token, response.data['token']);
        box.write(StorageKey.userId, response.data['user_id']);

    switch (status) {
      case 'verified':
       
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

  toggleLogin() {
    if (GetStorage().read(StorageKey.token) == null) {
      Get.to(Register());
    } else {
      routeToWriteBottomSheet();
    }
  }

  routeToWriteBottomSheet() {
    Get.bottomSheet(Container(
      height: Get.height / 2.5,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            children: [
             SvgPicture.asset(
                Assets.images.techbot.path,
                height: 40,width: 40,
              ),
              const SizedBox(
                width: 10,
              ),
               Text(MyString.shareKnowledge),
             
               ],
          ), const SizedBox(
                height: 30,
              ),
            Text(
                MyString.gigTech,maxLines: 3,)
           ,
           const SizedBox(
                height: 30,
              ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(NamedRoute.routeManageArticle);
                },
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.icon.writeArticle.path,
                        height: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text('مدیریت مقاله ها')
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
              
                },
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.icon.writePodcastIcon.path,
                        height: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text('مدیریت پادکست ها')
                    ],
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    ));
  }
}
