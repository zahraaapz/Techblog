// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tech_blog/component/color.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/view/homeScreen.dart';
import 'package:tech_blog/view/profileScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectPage = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      key: _key,
      child: Scaffold(
          drawer: Drawer(
            backgroundColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                  right: size.width / 10, left: size.width / 10),
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
                      'profile karbar',
                      style: textTheme.headline4,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      'darbare veblog',
                      style: textTheme.headline4,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      'eshterak gozaritechblog',
                      style: textTheme.headline4,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      'techblog dr github',
                      style: textTheme.headline4,
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
            backgroundColor: Solidcolor.bg,
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
                  image: Assets.images.techblog,
                  height: size.height / 23,
                ),
                const Icon(Icons.search, color: Colors.black)
              ],
            ),
          ),
          body: Stack(children: [
            Positioned.fill(
                child: IndexedStack(
              index: selectPage,
              children: [
                HomeScreen(size: size, textTheme: textTheme),
                ProfileScreen(size: size, textTheme: textTheme)
              ],
            )),
            Buttonbar(
              size: size,
              changeScreen: (int value) {
                setState(() {
                  selectPage = value;
                });
              },
            )
          ])),
    );
  }
}

class Buttonbar extends StatelessWidget {
  const Buttonbar({
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
                colors: GradientColor.naviButcolorBg,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding:
              EdgeInsets.only(left: size.width / 10, right: size.width / 10),
          child: Container(
            height: size.height / 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  colors: GradientColor.naviButcolor,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: ImageIcon(Assets.icon.home, color: Colors.white),
                  onPressed: () {
                    changeScreen(0);
                  },
                ),
                IconButton(
                  icon: ImageIcon(Assets.icon.write, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: ImageIcon(
                    Assets.icon.user,
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
