import 'package:get/get.dart';
import 'package:tech_blog/controller/article_controller.dart';
import 'package:tech_blog/controller/article_controller_single.dart';
import 'package:tech_blog/controller/registerController.dart';

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