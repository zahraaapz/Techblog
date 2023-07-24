import 'package:get/get.dart';
import 'package:tech_blog/Model/article.dart';
import 'package:tech_blog/Model/tags.dart';

import 'package:tech_blog/services/service.dart';

import '../../component/api_constant.dart';

class ArticleScreenController extends GetxController {
RxList<Tags>taglist=RxList();
RxList<ArticleModel>relatedlist=RxList();
RxList<ArticleModel> articleList = RxList();
 RxBool loading=false.obs;
  @override
  onInit() {
    super.onInit();
    getArticle();
  }

  getArticle() async {
    loading.value = true;
    var response = await DioServices().getMethod(ApiCons.articleList);

    response.data.forEach((element) {
     articleList.add(ArticleModel.fromJson(element));
    });

    loading.value = false;

   
  } 
  
   getArticleWithTagesId(String id) async {
    articleList.clear();
    loading.value = true;
    
    var response = await DioServices().getMethod('${ApiCons.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=');

    response.data.forEach((element) {
     articleList.add(ArticleModel.fromJson(element));
    });

    loading.value = false;
  }
}