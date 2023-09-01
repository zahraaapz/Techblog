import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/Model/article.dart';
import 'package:tech_blog/Model/tags.dart';
import 'package:tech_blog/component/constant/api_constant.dart';
import 'package:tech_blog/component/constant/storage_const.dart';
import 'package:tech_blog/component/constant/string.dart';
import 'package:tech_blog/services/service.dart';

import '../../Model/article_info.dart';
import '../file_controller.dart';


class ManageArticleController extends GetxController{
TextEditingController titletextEditingController=TextEditingController();
RxBool loading=false.obs;
  RxList<ArticleModel>articleList=RxList.empty();
  RxList<Tags>tagList=RxList.empty();
  Rx<ArticleInfoModel>articleInfoModel=ArticleInfoModel( 
 MyString.titltArrticle,MyString.editOrginalTextArticle,'').obs;

 @override
  onInit(){
    super.onInit();
 
    getManageArticle();
  }

  getManageArticle() async{
 loading.value=true;
   // var response=  await DioServices().getMethod(ApiCons.baseUrl+'article/get.php?command=published_by_me&user_id=');
    var response=  await DioServices().getMethod('${ApiCons.baseUrl}article/get.php?command=published_by_me&user_id=1');

     response.data.forEach((element){

      articleList.add(ArticleModel.fromJson(element));
     });

loading.value=false;


  }


  updateTitle(){

    articleInfoModel.update((val) { 

val!.title=titletextEditingController.text;

    });
  }

storeArticle()async{
loading.value=true;
var filePickerController=Get.find<FilePickerController>();
Map<String,dynamic>map={
 'title':articleInfoModel.value.title,
 'image': await  dio.MultipartFile.fromFile(filePickerController.file.value.path!),
 'catId':articleInfoModel.value.catId,
 'userId':GetStorage().read(StorageKey.userId),
 'command':'store',
 'tagList':'[]',

};

var response=await DioServices().postMethod(map, '${ApiCons.baseUrl}article/post.php');
log(response.data.toString());
loading.value=false;
  }
}