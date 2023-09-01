import 'package:get/get.dart';
import 'package:tech_blog/component/constant/api_constant.dart';
import 'package:tech_blog/services/service.dart';

import '../../Model/podcast_file.dart';

class SinglePodcastCotroller extends GetxController{

RxBool loading=false.obs;
var id;
RxList<PodcastFileModel>podcastFileList=RxList();

SinglePodcastCotroller({required this.id});


@override
onInit(){
getPodcastFile();
  super.onInit();
}


getPodcastFile()async{

loading.value=true;


var respose=await DioServices().getMethod('${ApiCons.baseUrl}podcast/get.php?command=get_files&podcasts_id=$id');

respose.data.forEach((e)=>podcastFileList.add(PodcastFileModel.fromJson(e)));

loading.value=false;

}

}