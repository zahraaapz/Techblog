

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:tech_blog/component/color.dart';

import '../controller/article_controller.dart';

class ArticleList extends StatelessWidget {
  final TextTheme textTheme;

 ArticleList({super.key, required this.textTheme});

  @override
  Widget build(BuildContext context) {

    ArticleScreenController articleScreenController=Get.put(ArticleScreenController());
    return SafeArea(child: Scaffold(
      
     
      
      appBar:
    PreferredSize(
      
      preferredSize: Size.fromHeight(80),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppBar(
           backgroundColor: Colors.transparent,
           elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Center(child: Text('data',style: textTheme.headlineMedium,)),
            )
          ],
          
          leading:
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: Container(height: 40,width: 40,decoration: 
            BoxDecoration(shape: BoxShape.circle,color: 
            SolidColor.primary.withBlue(100)),child: Icon(Icons.arrow_back),),
          ) ,
          
          
          
          
          
          ),
      ),
    ),
    
    body: SizedBox(child: ListView.builder(
      itemCount:articleScreenController.articleList.length ,
      itemBuilder:(context, index) {
      return Text(articleScreenController.articleList[index].title!);
    },)),),
    
    
    
    );
  }
}