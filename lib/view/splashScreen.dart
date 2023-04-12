// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/component/color.dart';

import 'package:tech_blog/view/ExractHomeScreen.dart';

import '../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: ((context) =>  MainScreen())));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            image: Assets.images.techblog,
            height: 80,
          ),
          const SizedBox(
            height: 10,
          ),
          const SpinKitCircle(
            size: 30,
            color: SolidColor.primary,
          ),
        ]),
      ),
    );
  }
}
