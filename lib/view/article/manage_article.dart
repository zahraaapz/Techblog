// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:tech_blog/component/constant/color.dart';
import 'package:tech_blog/component/component.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/component/constant/string.dart';

import 'package:tech_blog/view/article/article-list.dart';

import '../../Route_manager/Named.dart';
import '../../controller/article/manage_article_controller.dart';


class ManageArticle extends StatelessWidget {
 var  manageArticleController=Get.find<ManageArticleController>();

  ManageArticle({super.key});


  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(
                style: ButtonStyle(
                  
                  fixedSize: MaterialStateProperty.all(Size(Get.width/3, 56)),
                  backgroundColor: MaterialStateProperty.all(SolidColor.primary)),
                onPressed: () {
               Get.toNamed(NamedRoute.routeSingleManageArticle);
                },
                child: Text('بریم برای نوشتن یه مقاله باحال',style:textStyle.displayLarge,),
              ),
        ),
        appBar: appBar('مدیریت مقاله ها'),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
        child:Obx(() =>
           manageArticleController.loading.value?
          
             const SpinKitCircle(
            size: 30,
            color: SolidColor.primary,
          ):
        
         manageArticleController.articleList.isNotEmpty
            ? ListView.builder(
                physics:const BouncingScrollPhysics(),
              itemCount: manageArticleController.articleList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
    
                  onTap: () {
                 
                },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      SizedBox(
                          width: Get.width / 3,
                          height: Get.height / 6,
                          child: CachedNetworkImage(
                            imageUrl:
                                manageArticleController.articleList[index].image!,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                        image: imageProvider, fit: BoxFit.cover)),
                              );
                            },
                            placeholder: (context, url) => const SpinKitCircle(
                              color: SolidColor.primary,
                              size: 32,
                            ),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.image_not_supported_outlined,
                              color: SolidColor.divider,
                              size: 50,
                            ),
                          )),
                      const SizedBox(
                        width: 12,
                      ),
                      SizedBox(
                          width: Get.width / 2,
                          child: Column(children: [
                            Text(
                              manageArticleController.articleList[index].title!,
                              //overflow: TextOverflow.ellipsis,maxLines: 2,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(manageArticleController
                                    .articleList[index].author!),
                                  const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '${manageArticleController.articleList[index].view!} بازدید ',
                                  style: textTheme.bodyMedium,
                                )
                              ],
                            )
                          ]))
                    ]),
                  ),
                );
              },
          
        ):articleEmpty(textTheme),
        
      ))),
    );
  }

  Center articleEmpty(TextTheme textTheme) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
         Image.asset(
            Assets.images.emptyState.path,
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
        
        ]),
      );
  }

  

  
}
