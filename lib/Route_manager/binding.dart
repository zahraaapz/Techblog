import 'package:get/get.dart';
import 'package:tech_blog/controller/article/article_controller.dart';
import 'package:tech_blog/controller/article/article_controller_single.dart';
import 'package:tech_blog/controller/registerController.dart';

import '../controller/article/manage_article_controller.dart';

class  ArticleBinding implements Bindings{
  @override
  void dependencies() {

  Get.put(ArticleScreenController());
  Get.lazyPut(() => SingleArticleScreenController());

  
  }


}
class RegisterBinding implements Bindings
{
  @override
  void dependencies() {


    Get.put(RegisterController());


  }




}

class ArticleManagerBinding implements Bindings
{
  @override
  void dependencies() {


    Get.put(ManageArticleController());
  Get.lazyPut(() => SingleArticleScreenController());


  }




}