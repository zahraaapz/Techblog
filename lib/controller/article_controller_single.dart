import 'package:get/get.dart';

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