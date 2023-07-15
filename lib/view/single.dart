import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/component.dart';
import 'package:tech_blog/controller/article_controller_single.dart';
import 'package:tech_blog/gen/assets.gen.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:tech_blog/component/color.dart';

class Single extends StatefulWidget {
  Single({super.key});

  @override
  State<Single> createState() => _SingleState();
}

class _SingleState extends State<Single> {

    SingleArticleScreenController singleArticleScreenController = Get.put(SingleArticleScreenController());

  @override
  void initState(){
    super.initState();
singleArticleScreenController.getArticleInfo();
  }
  @override
  Widget build(BuildContext context) {
    //var id=Get.argumentd[0];
   

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(()=>
          Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    child: CachedNetworkImage(
                        imageUrl: singleArticleScreenController.articleInfo.value.image!,
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
                            Image.asset(Assets.images.singlePlaceHolder.path)),
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                         
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 24,shadows: [Shadow(color: Colors.blueGrey),Shadow(color: Colors.black)],
                          ), Expanded(child: SizedBox()),
                          Icon(
                            Icons.bookmark_border_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.share,
                            color: Colors.white,
                            size: 24,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(singleArticleScreenController.articleInfo.value.title!,style:textStyle.bodyMedium),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children:[
          
                Image.asset(Assets.images.avatar.path,height:50),
               const SizedBox(width:16),
          
           Text(singleArticleScreenController.articleInfo.value.author!,style:textStyle.bodyMedium),
           Text(singleArticleScreenController.articleInfo.value.createdAt!,style:textStyle.bodyMedium),
            ]),
          ),
               SizedBox(
                 child: HtmlWidget(
                         singleArticleScreenController.articleInfo.value.content!,
                         onLoadingBuilder: (context, element, loadingProgress) => const SpinKitCircle(
                              color: SolidColor.primary,
                              size: 32,
                            ),
                         textStyle: textStyle.headlineMedium,
                         enableCaching: true,),
               )   ],
          ),
        ),
      ),
    ));
  }
}
