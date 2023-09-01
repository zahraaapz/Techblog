import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_blog/component/dimention.dart';
import 'package:tech_blog/controller/podcast/single_controller_podcast.dart';

import '../../Model/podcast.dart';
import '../../component/component.dart';
import '../../component/constant/color.dart';
import '../../gen/assets.gen.dart';

class SinglePodcast  extends StatelessWidget{

late SinglePodcastCotroller singlePodcastCotroller;
late PodcastModel podcastModel;

SinglePodcast(){
podcastModel=Get.arguments;
singlePodcastCotroller=Get.put(SinglePodcastCotroller(id: podcastModel.id));
 }
  @override
  Widget build(BuildContext context) {
  return  SafeArea(
      child: Scaffold(
        body: Stack(
          children:[ 
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
              physics:const BouncingScrollPhysics(),
              child:
              Column(
                children: [
                  Stack(
                    children: [
                      CachedNetworkImage(
                          imageUrl: podcastModel.poster!,
                          imageBuilder: (context, imageProvider) {
                            return Image(
                               fit: BoxFit.fill,
                             image: imageProvider,
                            
                            );
                          },
                          placeholder: (context, url) => const SpinKitCircle(
                                color: SolidColor.primary,
                                size: 32,
                              ),
                          errorWidget: (context, url, error) =>
                              Image.asset(Assets.images.singlePlaceHolder.path)),
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
                            
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  Share.share('');
                                },
                                child: const Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      )
                 ,   ],
                  ),
              Padding(
                padding: const EdgeInsets.only(right: 10,top:25),
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(podcastModel.title!,style:textStyle.headlineLarge),
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children:[
              
                    Image.asset(Assets.images.avatar.path,height:50),
                   const SizedBox(width:16),
              
               Text(podcastModel.publisher!,style:textStyle.bodyMedium),
                const SizedBox(
                                width: 20,
                              ),
               
                ]),
              ),Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder:(context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                            Row(children: [
                                   ImageIcon(Image.asset(Assets.images.mic.path).image,color: SolidColor.colorTitle,),
                    const SizedBox(
                                    width: 8,
                                  ),
                                 Text('فریلنسر دیوانه',style:textStyle.bodyMedium),
                                
                            ],)
                                   ,Text('22:40',style:textStyle.bodyMedium),
                                
                                
                    ],),
                  );
                },),
              )
                  
                ],
                
              )),
            ),
            Positioned(
              bottom: 8,
              right:Dimention.bodyMargin,
            left:Dimention.bodyMargin,
              
              child: Container(
                height: Get.height/7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(colors: GradientColor.naviButColor)
                ),
           child:  Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
           
              children: [
              LinearPercentIndicator(
                percent: 1,
                backgroundColor: Colors.white,
                progressColor: SolidColor.selectedPadCast,
              )
           ,const Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
           
           
             Icon(Icons.skip_next,color: Colors.white,),
              Icon(Icons.play_circle_fill,color: Colors.white,size: 48,),
               Icon(Icons.skip_previous,color: Colors.white,),
               SizedBox(),
               Icon(Icons.repeat,color: Colors.white,),
           ],)
           
             ],),
           ),   )
            
            
            )
        
        ])));
  }
  
  




}


