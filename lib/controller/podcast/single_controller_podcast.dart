import 'dart:developer';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tech_blog/component/constant/api_constant.dart';
import 'package:tech_blog/services/service.dart';

import '../../Model/podcast_file.dart';

class SinglePodcastCotroller extends GetxController{
late var playList;
RxBool loading=false.obs;
var id;
RxList<PodcastFileModel>podcastFileList=RxList();
RxBool playState=false.obs;
final player=AudioPlayer();
SinglePodcastCotroller({required this.id});
 RxInt currectFileIndex=0.obs;

@override
onInit()async{
super.onInit();
playList=ConcatenatingAudioSource(children: [],useLazyPreparation: true) ;
await getPodcastFile();
await player.setAudioSource(playList,initialIndex:0,initialPosition:Duration.zero);
}


getPodcastFile()async{

loading.value=true;


var response=await DioServices().getMethod('${ApiCons.baseUrl}podcast/get.php?command=get_files&podcats_id='+id);
log(response.data.toString());

   for (var element in response.data["files"]) {
        var podcastFileModel = PodcastFileModel.fromJson(element);
        podcastFileList.add(podcastFileModel);
  playList.add(AudioSource.uri(Uri.parse(PodcastFileModel.fromJson(element).file!)));
    }




loading.value=false;

}

}