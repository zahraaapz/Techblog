

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_blog/component/constant/color.dart';


import 'package:tech_blog/component/component.dart';
import 'package:tech_blog/component/dimention.dart';
import 'package:tech_blog/controller/registerController.dart';

import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/services/service.dart';
import 'package:tech_blog/view/Home_screen/homeScreen.dart';
import 'package:tech_blog/view/Profile/profileScreen.dart';

import '../../component/constant/api_constant.dart';



class MainScreen extends StatelessWidget {


  final RxInt selectPage = 0.obs;

 final GlobalKey<ScaffoldState> _key = GlobalKey();

  MainScreen({super.key});



  @override
  Widget build(BuildContext context) {

    DioServices().getMethod(ApiCons.getHomeItem);
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
    
      child: 
       Scaffold(
          key: _key,
            drawer: Drawer(
              backgroundColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                    right: Dimention.bodyMargin, left: size.width / 10),
                child: ListView(
                  children: [
                    DrawerHeader(
                        child: Center(
                            child: Image.asset(
                      Assets.images.techblog.path,
                      scale: 3,
                    ))),
                    ListTile(
                      onTap: () {},
                      title: Text(
                        'پروفایل کاربر',
                        style: textTheme.headlineMedium,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      onTap: () {},
                      title: Text(
                        'درباره تکبلاگ',
                        style: textTheme.headlineMedium,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      onTap: () async {
                       await Share.share('www.sasansafari.com');
                      },
                      title: Text(
                        'اشتراک گزاری تکبلاگ',
                        style: textTheme.headlineMedium,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      onTap: () {
                        mylounchUrl('https://github.com/zahraaapz');
                      },
                      title: Text(
                        'تکبلاگ در گیت هاب',
                        style: textTheme.headlineMedium,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: SolidColor.bg,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                    
                       _key.currentState!.openDrawer();
                      },
                      child: const Icon(Icons.menu, color: Colors.black)),
                  Image(
                    image: Assets.images.techblog.provider(),
                    height: size.height / 23,
                  ),
                  const Icon(Icons.search, color: Colors.black)
                ],
              ),
            ),
            body: Stack(children: [
              Positioned.fill(
                  child: Obx(() =>   IndexedStack(
                index: selectPage.value,
                children: [
                  HomeScreen(size: size, textTheme: textTheme),
                  ProfileScreen(size: size, textTheme: textTheme)
                ],
              ))
          ),
              Buttonbar(
                size: size,
                changeScreen: (int value) {
                
                    selectPage.value = value;
                 
                },
              )
            ])),
      
    );
  }
}

class Buttonbar extends StatelessWidget {
  RegisterController registerController =Get.put(RegisterController());
  Buttonbar({
    Key? key,
    required this.size,
    required this.changeScreen,
  }) : super(key: key);

  final Size size;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 10,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: GradientColor.naviButColorBg,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding:
              EdgeInsets.only(left: Dimention.bodyMargin, right: size.width / 10),
          child: Container(
            height: size.height / 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  colors: GradientColor.naviButColor,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: ImageIcon(Assets.icon.home.provider(), color: Colors.white),
                  onPressed: () {
                    changeScreen(0);
                  },
                ),
                IconButton(
                  icon: ImageIcon(Assets.icon.write.provider(), color: Colors.white),
                  onPressed: () {

                registerController.toggleLogin();
                  },
                ),
                IconButton(
                  icon: ImageIcon(
                    Assets.icon.user.provider(),
                    color: Colors.white,
                  ),
                  onPressed: () {
                    changeScreen(1);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
