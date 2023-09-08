import 'package:get/get.dart';
import 'package:tech_blog/Route_manager/Named.dart';
import 'package:tech_blog/view/splash/splashScreen.dart';

import 'binding.dart';
import '../view/Home_screen/ExractHomeScreen.dart';
import '../view/article/manage_article.dart';
import '../view/article/single.dart';
import '../view/article/single_manage_article.dart';
import '../view/podcast/single_podcast.dart';

class Pages{

Pages._();
  static   List<GetPage<dynamic>>page=[
   GetPage(name:NamedRoute.routeMainScreen , page: ()=>MainScreen(),binding: RegisterBinding()),
   GetPage(name:NamedRoute.routeMain, page: ()=>const SplashScreen(),),
    GetPage(name:NamedRoute.routeSinglePodcast , page: ()=>SinglePodcast()),
    GetPage(name: NamedRoute.routeSingleArticle, page: ()=>const Single(),binding: ArticleBinding()),
    GetPage(name: NamedRoute.routeManageArticle, page: ()=>ManageArticle(),binding: ArticleManagerBinding()),
    GetPage(name: NamedRoute.routeSingleManageArticle, page: ()=>const SingleManageArticle(),binding: ArticleManagerBinding()),
 
];










}