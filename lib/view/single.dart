import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/component.dart';
import 'package:tech_blog/controller/article_controller.dart';
import 'package:tech_blog/controller/article_controller_single.dart';
import 'package:tech_blog/gen/assets.gen.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:tech_blog/component/color.dart';
import 'package:tech_blog/view/article-list.dart';

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
          physics:const BouncingScrollPhysics(),
          child: Obx(()=>singleArticleScreenController.articleInfo.value.image==null?SizedBox(
            height: Get.height,
            child: SpinKitCircle(
                                color: SolidColor.primary,
                                size: 32,
                              ),
          ):
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
            padding: const EdgeInsets.only(right: 10,top:25),
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(singleArticleScreenController.articleInfo.value.title!,style:textStyle.headlineLarge),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children:[
          
                Image.asset(Assets.images.avatar.path,height:50),
               const SizedBox(width:16),
          
           Text(singleArticleScreenController.articleInfo.value.author!,style:textStyle.bodyMedium), SizedBox(
                            width: 20,
                          ),
           Text(singleArticleScreenController.articleInfo.value.createdAt!,style:textStyle.bodyMedium),
            ]),
          ),
               SizedBox(
                width:Get.width/1.1,
                 child: HtmlWidget(
                         singleArticleScreenController.articleInfo.value.content!,
                         onLoadingBuilder: (context, element, loadingProgress) => const SpinKitCircle(
                              color: SolidColor.primary,
                              size: 32,
                            ),
                         textStyle: textStyle.headlineMedium,
                         enableCaching: true,),
               ) ,  

               SizedBox(height: 20,),
               
     singleArticleScreenController.taglist[0].title==null? const SpinKitCircle(
                              color: SolidColor.primary,
                              size: 32,
                            ): TagList(),
               SizedBox(height: 20,),
          simillar()    ],
          ),
        ),
      ),
    ));
  }



  SizedBox simillar() {
    return SizedBox(
      height: Get.height / 3.3,
      child: Obx(
        () => ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: singleArticleScreenController.relatedlist.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding:
                    EdgeInsets.only(right:8,),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          child: CachedNetworkImage(
                        imageUrl:
                            singleArticleScreenController.relatedlist[index].image!,
                        imageBuilder: (context, imageProvider) {
                          return Stack(children: [
                            Container(
                              height: Get.height / 5.3,
                              width: Get.width / 2.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                      fit: BoxFit.cover, image: imageProvider)),
                              foregroundDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(
                                      colors: GradientColor.blog,
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter)),
                            ),
                            Positioned(
                              bottom: 0,
                              child: SizedBox(
                                width: Get.width / 2.4,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                       singleArticleScreenController  
                                              .relatedlist[index].author==null?'unknown':
                                              singleArticleScreenController.relatedlist[index].author!,
                                          style: textStyle.displayLarge),
                                      Row(
                                        children: [
                                          Text(
                                            singleArticleScreenController
                                                .relatedlist[index].view!,
                                            style: textStyle.displayLarge,
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          const Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.white,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]);
                        },
                        errorWidget: (context, url, error) {
                          return const Icon(
                            Icons.image_not_supported_outlined,
                            color: SolidColor.divider,
                            size: 50,
                          );
                        },
                        placeholder: (context, url) {
                          return const SpinKitCircle(
                            color: SolidColor.primary,
                            size: 32,
                          );
                        },
                      )),
                    ),
                    SizedBox(
                      width: Get.width / 2.4,
                      child: Text(
                        

                        singleArticleScreenController.relatedlist[index].title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              );
            })),
      ),
    );
  }

  

  TagList( ) {
    return SizedBox(
        height: 35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: singleArticleScreenController.taglist.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(

              onTap: () async{
                await Get.find<ArticleScreenController>().getArticleWithTagesId(singleArticleScreenController.taglist[index].id!);
       Get.to(ArticleList(textTheme:textStyle)) ;      },
              child: Padding(
                padding: EdgeInsets.only(
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
                         singleArticleScreenController.taglist[index].title!,
                          style: textStyle.displayLarge,
                        )
                     
                  ),
                ),
              ),
            );
          },
        ));
  }}