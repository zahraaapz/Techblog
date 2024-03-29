import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';


import 'package:tech_blog/component/constant/color.dart';


import '../../Route_manager/Named.dart';
import '../../controller/article/article_controller.dart';
import '../../controller/article/article_controller_single.dart';

class ArticleList extends StatelessWidget {
  final TextTheme textTheme;

  const ArticleList({super.key, required this.textTheme});

  @override
  Widget build(BuildContext context) {
   var articleScreenController = Get.find<ArticleScreenController>();
    var singleArticleScreenController = Get.find<SingleArticleScreenController>();

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: appBar('مقالات جدید'),
          ),
        ),
        body: SizedBox(
            child: Obx(
          () => ListView.builder(
              physics:const BouncingScrollPhysics(),
            itemCount: articleScreenController.articleList.length,
            itemBuilder: (context, index) {
              return GestureDetector(

                onTap: () {
                 // Get.to(Single(),arguments: [articleScreenController.articleList[index].id]);
      
              singleArticleScreenController.id.value=int.parse(articleScreenController.articleList[index].id!);
         //  singleArticleScreenController.getarticleInfo(int.parse(articleScreenController.articleList[index].id!));
                    
               
                      
                     Get.toNamed(NamedRoute.routeSingleArticle);   
                 
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
                              articleScreenController.articleList[index].image!,
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
                            articleScreenController.articleList[index].title!,
                            //overflow: TextOverflow.ellipsis,maxLines: 2,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(articleScreenController
                                  .articleList[index].author!),
                                const SizedBox(
                                width: 20,
                              ),
                              Text(
                                '${articleScreenController.articleList[index].view!} بازدید ',
                                style: textTheme.bodyMedium,
                              )
                            ],
                          )
                        ]))
                  ]),
                ),
              );
            },
          ),
        )),
      ),
    );
  }


}  AppBar appBar(String title) {

    return AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions:  [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Center(
                    child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: SolidColor.divider),
                )),
              )
            ],
            leading: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: SolidColor.primary.withBlue(100)),
                  child: const Icon(Icons.arrow_back),
                ),
              ),
            ),
          );
  }
