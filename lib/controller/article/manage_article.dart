import 'package:get/get.dart';
import 'package:tech_blog/Model/article.dart';
import 'package:tech_blog/Model/tags.dart';
import 'package:tech_blog/component/constant/api_constant.dart';
import 'package:tech_blog/component/constant/string.dart';
import 'package:tech_blog/services/service.dart';


class ManageArticleController extends GetxController{

RxBool loading=false.obs;
  RxList<ArticleModel>articleList=RxList.empty();
  RxList<Tags>tagList=RxList.empty();
  Rx<ArticleModel>articleInfoModel=ArticleModel( 
 MyString.titltArrticle,MyString.editOrginalTextArticle
,'').obs;

  void onInit(){
    super.onInit();
 
    getManageArticle();
  }

  getManageArticle() async{
 loading.value=true;
   // var response=  await DioServices().getMethod(ApiCons.baseUrl+'article/get.php?command=published_by_me&user_id=');
    var response=  await DioServices().getMethod('${ApiCons.baseUrl}article/get.php?command=published_by_me&user_id=198');

     response.data.forEach((element){

      articleList.add(ArticleModel.fromJson(element));
     });

loading.value=false;


  }
}