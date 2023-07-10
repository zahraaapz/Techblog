import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:tech_blog/component/color.dart';

import '../controller/article_controller.dart';

class ArticleList extends StatelessWidget {
  final TextTheme textTheme;

  ArticleList({super.key, required this.textTheme});

  @override
  Widget build(BuildContext context) {
    ArticleScreenController articleScreenController =
        Get.put(ArticleScreenController());
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: const [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Center(
                      child: Text(
                    'مقالات جدید',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                        color: SolidColor.divider),
                  )),
                )
              ],
              leading: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: SolidColor.primary.withBlue(100)),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
        ),
        body: SizedBox(
            child: Obx(
          () => ListView.builder(
            itemCount: articleScreenController.articleList.length,
            itemBuilder: (context, index) {
              return Padding(
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
              );
            },
          ),
        )),
      ),
    );
  }
}
