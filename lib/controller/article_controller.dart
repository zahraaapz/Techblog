import 'package:get/get.dart';
import 'package:tech_blog/Model/article.dart';

import 'package:tech_blog/services/service.dart';

import '../component/api_constant.dart';

class ArticleScreenController extends GetxController {

  RxList<ArticleModel> articleList = RxList();
 RxBool loading=false.obs;
  @override
  onInit() {
    super.onInit();
    getarticle();
  }

  getarticle() async {
    loading.value = true;
    var response = await DioServices().getMethod(ApiCons.articleList);

    response.data.forEach((element) {
     articleList.add(ArticleModel.fromJson(element));
    });

    loading.value = false;
  }
}