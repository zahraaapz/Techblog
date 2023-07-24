// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/color.dart';
import 'package:tech_blog/component/component.dart';
import 'package:tech_blog/controller/registerController.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/component/string.dart';
import 'package:tech_blog/view/article/article-list.dart';
import 'package:validators/validators.dart';

class ManageArticle extends StatelessWidget {
 var  registerController=Get.find<RegisterController>();

  ManageArticle({super.key});


  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: appBar('مدیریت مقاله ها'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: articleEmpty(textTheme),
      ),
    );
  }

  Center articleEmpty(TextTheme textTheme) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            Assets.images.techbot.path,
            height: 100,
            width: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: MyString.articleEmpty, style: textTheme.headlineMedium)),
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                
                
                backgroundColor: MaterialStateProperty.all(SolidColor.primary)),
              onPressed: () {
             
              },
              child: Text('بریم برای نوشتن یه مفاله باحال',style:textStyle.displayLarge,),
            ),
          )
        ]),
      );
  }

  

  
}
