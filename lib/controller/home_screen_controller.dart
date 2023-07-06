import 'package:get/get.dart';
import 'package:tech_blog/Model/article.dart';
import 'package:tech_blog/Model/podcast.dart';
import 'package:tech_blog/Model/poster.dart';
import 'package:tech_blog/services/service.dart';

import '../component/api_constant.dart';

class HomeScreenController extends GetxController{

  Rx<Poster>poster=Poster().obs;
   RxList taglist=RxList();
   RxList<ArticleModel> topVisitedList=RxList();
   RxList <PodcastModel>topPodcast=RxList();
RxBool loading=false.obs;

@override
onInit(){
super.onInit();
getHomeItem();
}
getHomeItem() async{
loading.value=true;
var response= await DioServices().getMethod(ApiCons.getHomeItem);

 poster.value=Poster.fromJson(response.data['poster']);

  response.data['top_visited'].forEach((element){

    topVisitedList.add(
ArticleModel.fromJson(element));


  }); 
   response.data['top_podcasts'].forEach((element){

    topPodcast.add(
PodcastModel.fromJson(element));


  });
 loading.value=false;
}




}

