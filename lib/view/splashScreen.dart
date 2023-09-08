// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/constant/color.dart';

import '../Route_manager/Named.dart';
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
Get.offAndToNamed(NamedRoute.routeMainScreen);


    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
         image:Assets.images.techblog.provider(),
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
