import 'package:get/get.dart';
import 'package:tech_blog/Model/article.dart';

import 'package:tech_blog/services/service.dart';

import '../component/api_constant.dart';

class SingleArticleScreenController extends GetxController {

RxInt id=RxInt(0);
 RxBool loading=false.obs;
  @override
  onInit() {
    super.onInit();
    getarticleInfo();
  }

  getarticleInfo() async {
    loading.value = true;
   // var response = await DioServices().getMethod(ApiCons.articleList);

 
    loading.value = false;
  }
}