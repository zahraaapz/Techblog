import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/color.dart';
import 'package:tech_blog/Model/model.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/controller/article/article_controller.dart';
import 'package:tech_blog/controller/article/article_controller_single.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/main.dart';
import 'package:tech_blog/view/article/article-list.dart';
import 'package:tech_blog/view/article/single.dart';

import '../gen/assets.gen.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

 final Size size;
 final TextTheme textTheme;

 final HomeScreenController homeScreenController = Get.put(HomeScreenController());
ArticleScreenController articleScreenController = Get.put(ArticleScreenController());
SingleArticleScreenController singleArticleScreenController = Get.put(SingleArticleScreenController());



  @override
  Widget build(BuildContext context) {
    homeScreenController.getHomeItem();

    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(1.0),
            child: homeScreenController.loading.value == false
                ? Column(children: [
                    posterImage(),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: tagListHome( size, textTheme),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.0, right: size.width / 10, bottom: 8),
                      child: Row(
                        children: [
                          ImageIcon(
                            Assets.images.pen.provider(),
                            color: SolidColor.colorTitle,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(ArticleList(textTheme: textTheme));
                            },
                            child: Text(
                              'مشاهده داغ ترین نوشته ها',
                              style: textTheme.displaySmall,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      
                      onTap: () async{
                        
                      
                        Get.toNamed(NamedRoute.routeSingleArticle);
                      },
                      
                      child: blogList()),
                    Padding(
                      padding: EdgeInsets.only(right: size.width / 10),
                      child: Row(
                        children: [
                          ImageIcon(Assets.images.mic.provider(),
                              color: SolidColor.colorTitle),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'مشاهده داغ ترین پادکست ها',
                            style: textTheme.displaySmall,
                          )
                        ],
                      ),
                    ),
                    podcastList(),
                    const SizedBox(
                      height: 60,
                    )
                  ])
                : const SpinKitCircle(
                    color: SolidColor.primary,
                    size: 32,
                  ),
          ),
        ));
  }

  SizedBox podcastList() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
            itemCount: homeScreenController.topPodcast.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    right: index == 0 ? size.width / 10 : 15, top: 16),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: size.height / 5.3,
                          width: size.width / 2.4,
                          child: CachedNetworkImage(
                            imageUrl:
                                homeScreenController.topPodcast[index].poster!,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              );
                            },
                            placeholder: (context, url) {
                              return const SpinKitCircle(
                                color: SolidColor.primary,
                                size: 32,
                              );
                            },
                            errorWidget: (context, url, error) {
                              return const Icon(
                                Icons.image_not_supported_outlined,
                                color: SolidColor.divider,
                                size: 50,
                              );
                            },
                          ),
                        )),
                    Text(homeScreenController.topPodcast[index].title!)
                  ],
                ),
              );
            })),
      ),
    );
  }

  SizedBox blogList() {
    return SizedBox(
      height: size.height / 3.3,
      child: Obx(
        () => ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: homeScreenController.topVisitedList.length,
            itemBuilder: ((context, index) {
              return GestureDetector(


                onTap: () {
                  singleArticleScreenController.id.value=int.parse(homeScreenController.topVisitedList[index].id!);
          Get.to(const Single()) ;     },
                child: Padding(
                  padding:
                      EdgeInsets.only(right: index == 0 ? size.width / 10 : 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            child: CachedNetworkImage(
                          imageUrl:
                              homeScreenController.topVisitedList[index].image!,
                          imageBuilder: (context, imageProvider) {
                            return Stack(children: [
                              Container(
                                height: size.height / 5.3,
                                width: size.width / 2.4,
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
                                  width: size.width / 2.4,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            homeScreenController
                                                .topVisitedList[index].author!,
                                            style: textTheme.displayLarge),
                                        Row(
                                          children: [
                                            Text(
                                              homeScreenController
                                                  .topVisitedList[index].view!,
                                              style: textTheme.displayLarge,
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
                        width: size.width / 2.4,
                        child: Text(
                          homeScreenController.topVisitedList[index].title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }

  Stack posterImage() {
    return Stack(
      children: [
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  colors: GradientColor.poster,
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter)),
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: imageProvider))),
            placeholder: (context, url) => const SpinKitCircle(
              color: SolidColor.primary,
              size: 32,
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.image_not_supported_outlined,
              color: SolidColor.divider,
              size: 50,
            ),
          ),
        ),
        Positioned(
          bottom: 8,
         
          
          child: Column(
            children: [
              Text(
                homeScreenController.poster.value.title!,
                style: textTheme.displayMedium,
                textAlign: TextAlign.center,
              )
            ],
          ),
        )
      ],
    );
  }




  tagListHome( size,textTheme) {
    return SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listTag.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(


              onTap: () {
             articleScreenController.getArticleWithTagesId(homeScreenController.taglist[index].id!);
                Get.to(ArticleList(textTheme: textTheme));
              },
              child: Padding(
                padding: EdgeInsets.only(
                    right: index == 0 ? size.width / 10 : 15, top: 5),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      colors: GradientColor.tags,
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8.0, 8, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '#',
                          style: TextStyle(fontSize: 26, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          Get.find<HomeScreenController>().taglist[index].title!,
                          style: textTheme.displayLarge,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}