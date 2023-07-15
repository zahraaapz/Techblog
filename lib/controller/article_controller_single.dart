import 'package:get/get.dart';

import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/services/service.dart';

import '../Model/article_info.dart';

class SingleArticleScreenController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0 );
  Rx<ArticleInfo> articleInfo=ArticleInfo().obs;

@override   
onInit(){

  super.onInit;

}


  getArticleInfo() async {
    var userId='';
    print('${ApiCons.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');
    loading.value = true;


   var response = await DioServices().getMethod(ApiCons.baseUrl+'article/get.php?command=info&id=$id&user_id=$userId');
 
   if (response.statuscode==200) {
     
   
    articleInfo.value=ArticleInfo.fromJson(response.data);
  
    loading.value = false;
    
  }}
}