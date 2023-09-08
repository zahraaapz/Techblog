import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_blog/component/dimention.dart';
import 'package:tech_blog/controller/podcast/single_controller_podcast.dart';
import '../../Model/podcast.dart';
import '../../component/component.dart';
import '../../component/constant/color.dart';
import '../../gen/assets.gen.dart';

class SinglePodcast extends StatelessWidget {
  late SinglePodcastCotroller singlePodcastCotroller;
  late PodcastModel podcastModel;

  SinglePodcast() {
    podcastModel = Get.arguments;
    singlePodcastCotroller =
        Get.put(SinglePodcastCotroller(id: podcastModel.id));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: Get.height / 3,
                      child: CachedNetworkImage(
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
                          errorWidget: (context, url, error) => Image.asset(
                              Assets.images.singlePlaceHolder.path)),
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
                        child: Row(
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
                                size: 24,
                                shadows: [
                                  Shadow(color: Colors.blueGrey),
                                  Shadow(color: Colors.black)
                                ],
                              ),
                            ),
                            const Expanded(child: SizedBox()),
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
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(podcastModel.title!, style: textStyle.headlineLarge),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Image.asset(Assets.images.avatar.path, height: 50),
                    const SizedBox(width: 16),
                    Text(podcastModel.publisher!, style: textStyle.bodyMedium),
                    const SizedBox(
                      width: 20,
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => ListView.builder(
                      itemCount: singlePodcastCotroller.podcastFileList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            await singlePodcastCotroller.player
                                .seek(Duration.zero, index: index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ImageIcon(
                                      Image.asset(Assets.images.mic.path).image,
                                      color: SolidColor.colorTitle,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SizedBox(
                                        width: Get.width / 1.5,
                                        child: Obx(
                                          () => Text(
                                              singlePodcastCotroller
                                                  .podcastFileList[index]
                                                  .title!,
                                              style: singlePodcastCotroller
                                                          .currectFileIndex
                                                          .value ==
                                                      index
                                                  ? textStyle.displaySmall
                                                  : textStyle.bodyMedium),
                                        )),
                                  ],
                                ),
                                Text(
                                    '${singlePodcastCotroller.podcastFileList[index].length!}:00',
                                    style: textStyle.bodyMedium),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            )),
      ),
      Positioned(
          bottom: 8,
          right: Dimention.bodyMargin,
          left: Dimention.bodyMargin,
          child: Container(
            height: Get.height / 7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(colors: GradientColor.naviButColor)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(
                    ()=> ProgressBar(
                      timeLabelTextStyle: TextStyle(color: Colors.white),
                       thumbColor: Colors.orange,
                       progressBarColor:  Colors.orange,
                       total: singlePodcastCotroller.player.duration??Duration(seconds: 0),
                       progress: singlePodcastCotroller.progressValue.value,
                       baseBarColor:  Colors.white,
                       buffered: singlePodcastCotroller.bufferedValue.value,
                       bufferedBarColor:  Color.fromARGB(134, 233, 192, 131),
                       onSeek: (value) async{


                         singlePodcastCotroller.player.seek(value);
                     

                         if(  singlePodcastCotroller.player.playing){
                          singlePodcastCotroller.startProgressBar();
                         }else if(value<=Duration(seconds: 0)){
                          await singlePodcastCotroller.player.seekToNext();
                          singlePodcastCotroller.currectFileIndex.value=singlePodcastCotroller.player.currentIndex!;
                       singlePodcastCotroller.timerCheck();  }



                       
                       },
                    
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () async {
                            await singlePodcastCotroller.player.seekToNext();
                            singlePodcastCotroller.currectFileIndex.value =
                                singlePodcastCotroller.player.currentIndex!;
                                 singlePodcastCotroller.timerCheck(); 
                          },
                          child: const Icon(
                            Icons.skip_next,
                            color: Colors.white,
                          )),
                      GestureDetector(
                          onTap: () {

                            singlePodcastCotroller.player.playing
                                ? singlePodcastCotroller.timer!.cancel()
                                : singlePodcastCotroller.startProgressBar(); 
                                
                                
                                 singlePodcastCotroller.player.playing
                                ? singlePodcastCotroller.player.pause()
                                : singlePodcastCotroller.player.play();

                            singlePodcastCotroller.playState.value =
                                singlePodcastCotroller.player.playing;

                            singlePodcastCotroller.currectFileIndex.value =
                                singlePodcastCotroller.player.currentIndex!;

                          },
                          child: Obx(() => Icon(
                                singlePodcastCotroller.playState.value
                                    ? Icons.pause_circle_filled
                                    : Icons.play_circle_fill,
                                color: Colors.white,
                                size: 48,
                              ))),
                      GestureDetector(
                          onTap: () async {
                            await singlePodcastCotroller.player
                                .seekToPrevious();
                            singlePodcastCotroller.currectFileIndex.value =
                                singlePodcastCotroller.player.currentIndex!;
                                 singlePodcastCotroller.timerCheck(); 
                          },
                          child: const Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                          )),
                      const SizedBox(),
                      GestureDetector(
                        onTap: () {
                          singlePodcastCotroller.setLoopMode();
                        },
                        child:  Icon(
                          Icons.repeat,
                          color:  singlePodcastCotroller.isLoopMode.value? Colors.blue: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ))
    ])));
  }
}
