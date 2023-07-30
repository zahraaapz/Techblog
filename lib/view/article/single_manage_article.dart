



import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tech_blog/component/component.dart';
import 'package:tech_blog/component/constant/string.dart';
import 'package:tech_blog/controller/article/article_controller.dart';
import 'package:tech_blog/controller/article/manage_article.dart';
import 'package:tech_blog/controller/file_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:tech_blog/component/constant/color.dart';
import 'package:tech_blog/services/pick_file.dart';
import 'package:tech_blog/view/article/article-list.dart';

import '../../component/dimention.dart';

class SingleManageArticle extends StatefulWidget {
 const SingleManageArticle({super.key});

  @override
  State<SingleManageArticle> createState() => _SingleManageArticleState();
}

class _SingleManageArticleState extends State<SingleManageArticle> {

var manageArticleController=Get.find<ManageArticleController>();
 var articleScreenController = Get.find<ArticleScreenController>();
FilePickerController filePickerController=Get.put(FilePickerController());


getTitle(){


  Get.defaultDialog(
    title: 'عنوان مقاله',
    radius: 8,
    confirm: ElevatedButton(onPressed: (){
manageArticleController.updateTitle();
      Get.back();
    }, child:Text('ثبت')),
    titleStyle: TextStyle(color: SolidColor.bg),
    backgroundColor: SolidColor.primary,
    content: TextField(
      controller:manageArticleController.titletextEditingController ,
      keyboardType: TextInputType.text,
      style: TextStyle(
        color: SolidColor.colorTitle
      ),
      decoration: InputDecoration(
        hintText: 'اینجا بنویس',

      ),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    //var id=Get.argumentd[0];
 
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Obx(()=>
          Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: Get.height/3,
                    child:
filePickerController.file.value.name=='not'?
                  CachedNetworkImage(
                      imageUrl: manageArticleController.articleInfoModel.value.image!,
                      imageBuilder: (context, imageProvider) {
                        return Image(
                          
                         image: imageProvider,
                        );
                      },
                      placeholder: (context, url) => const SpinKitCircle(
                            color: SolidColor.primary,
                            size: 32,
                          ),
                      errorWidget: (context, url, error) =>
                          Image.asset(Assets.images.singlePlaceHolder.path,)):
                          Image.file(
                            
                            File(filePickerController.file.value.path!),fit: BoxFit.cover,),
                  ),          
                  Positioned(
                    right: 0,
                    left: 0,
                    top: 0,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter,
                              colors: GradientColor.singleAppbar)),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                         
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 24,shadows: [Shadow(color: Colors.blueGrey),Shadow(color: Colors.black)],
                            ),
                          ), const Expanded(child: SizedBox()),
                      
                        ],
                      ),
                    ),
                  )
          ,Positioned(
              bottom: 0,left: 0,right: 0,
              
              child: Center(child: GestureDetector(
                onTap: () {
                  pickFile();
                },
                child: Container(
                  
                  
                  height:30,width: Get.width/3
                  ,decoration: const BoxDecoration(color: SolidColor.primary,borderRadius: 
                  BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text('انتخاب تصویر',style: textStyle.displayLarge,),
                    Icon(Icons.add,color: Colors.white,)
                  ]),
                  
                  ),
              )))      ],
              ),
    const SizedBox(height: 20,),
         GestureDetector(
          onTap:() {
            
          },
          
          child: titleRowArticle('ویرایش عنوان مقاله',Dimention.bodyMargin/2)),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
               const SizedBox(width: 20,),
              Text(MyString.titltArrticle),
            ],
          ),    const SizedBox(height: 20,),

           titleRowArticle('ویرایش متن اصلی مقاله',Dimention.bodyMargin/2),
      Padding(
        padding: const EdgeInsets.only(right:20.0,left: 20),
        child: Text(MyString.editOrginalTextArticle,),
      ),
              
    const SizedBox(height: 20,),

       titleRowArticle('انتخاب دسته بندی',Dimention.bodyMargin/2),

               
             
                 ],
          ),
        ),
      ),
    ));
  }




  


  tagList( ) {
    return SizedBox(
        height: 35,
        child: Obx(()=>
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: manageArticleController.tagList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
        
                onTap: () {
                   articleScreenController.getArticleWithTagesId(manageArticleController.tagList[index].id!);
               Get.to(ArticleList(textTheme:textStyle)) ;      },
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 12),
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                    color: Colors.grey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8.0, 8, 8),
                      child: 
                      
                          Text(
                           manageArticleController.tagList[index].title!,
                            style: textStyle.displayLarge,
                          )
                       
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }}