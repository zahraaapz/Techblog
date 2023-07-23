// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/color.dart';
import 'package:tech_blog/component/component.dart';
import 'package:tech_blog/controller/registerController.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/component/string.dart';
import 'package:validators/validators.dart';

class Register extends StatelessWidget {
  var  registerController=Get.find<RegisterController>();

  Register({super.key});
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset(
              Assets.images.techbot.path,
              height: 100,
              width: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyString.wellcom, style: textTheme.headlineMedium)),
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  
                  
                  backgroundColor: MaterialStateProperty.all(SolidColor.primary)),
                onPressed: () {
                  showBottonEmail(context, textTheme);
                },
                child: Text('بزن بریم',style:textStyle.displayLarge,),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Future<dynamic> showBottonEmail(BuildContext context, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'لطفا ایمیلت وارد کن',
                        style: textTheme.headlineMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: Get.width/1.5,
                        child: TextField(textAlign: TextAlign.center,
                          controller: registerController.emailTextEditingController,
                          onChanged: (value) {
                            print(value + 'is email' + isEmail(value).toString());
                          },
                          decoration:  InputDecoration(
                            hintText: 'techblog@gmail.com',hintStyle: textStyle.headlineLarge
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(SolidColor.primary)),
                          onPressed: (() {
                            registerController.register();
                            Navigator.pop(context);
                            showBottonCode(context, textTheme);
                            
                          }),
                          child: Text(
                            'ادامه',
                            style: textStyle.displayLarge,
                          )),
                    )
                  ]),
            ),
          );
        }));
  }

  Future<dynamic> showBottonCode(BuildContext context, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'کد را وارد کنید',
                        // style: textStyle.headlineLarge,
                      ),
                    ),
                   
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: Get.width/1.5,
                        child:  TextField(
                          controller: registerController.activeTextEditingController ,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: '******',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(SolidColor.primary)),
                            onPressed: (() {
                              registerController.verify();
                              // Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(builder: ((context) {
                              //   return const MyCats();
                              // })));
                       
                            }),
                            child: Text(
                              'ادامه',
                              style: textStyle.displayLarge,
                            )),
                      ),
                    )
                  ]),
            ),
          );
        }));
  }
}
