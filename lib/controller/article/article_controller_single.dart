import 'package:get/get.dart';
import 'package:tech_blog/Model/article.dart';
import 'package:tech_blog/Model/tags.dart';

import 'package:tech_blog/component/constant/api_constant.dart';
import 'package:tech_blog/services/service.dart';

import '../../Model/article_info.dart';

class SingleArticleScreenController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfo = ArticleInfoModel(null, null, null).obs;
  RxList<Tags> taglist = RxList();
  RxList<ArticleModel> relatedlist = RxList();

  getArticleInfo() async {
    articleInfo = ArticleInfoModel(null, null, null).obs;

    var userId = '';

    loading.value = true;

    var response = await DioServices().getMethod(
        '${ApiCons.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');

    articleInfo.value = ArticleInfoModel.fromJson(response.data);

    loading.value = false;

    taglist.clear();
    response.data['tags'].forEach((element) {
      taglist.add(Tags.fromJson(element));
    });

    relatedlist.clear();
    response.data['related'].forEach((element) {
      relatedlist.add(ArticleModel.fromJson(element));
    });
  }
}
