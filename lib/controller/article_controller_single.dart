import 'package:get/get.dart';
import 'package:tech_blog/Model/article_info.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/services/service.dart';

class SingleArticleScreenController extends GetxController {
Rx<ArticleInfo>articleInfo=ArticleInfo().obs;
RxInt id=RxInt(0);
 RxBool loading=false.obs;
  @override
  onInit() {
    super.onInit();
    getarticleInfo();
  }

  getarticleInfo() async {
    var userId='';
    loading.value = true;
    var response = await DioServices().getMethod('${ApiCons.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');

 articleInfo.value=ArticleInfo.fromJson(response.data);
    loading.value = false;
  }
}