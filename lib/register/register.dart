// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/registerController.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/component/string.dart';
import 'package:tech_blog/view/my-cat.dart';
import 'package:validators/validators.dart';

class Register extends StatelessWidget {
   RegisterController registerController=Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.network(
              Assets.images.techbot.path,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyString.wellcom, style: textTheme.headlineMedium)),
            ),
            ElevatedButton(
              onPressed: () {
                showBottonEmail(context, textTheme);
              },
              child: const Text('بزن بریم'),
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
                      child: TextField(
                        controller: registerController.emailTextEditingController,
                        onChanged: (value) {
                          print(value + 'is email' + isEmail(value).toString());
                        },
                        decoration: const InputDecoration(
                          hintText: 'techblog@gmail.com',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: (() {
                            registerController.register();
                            Navigator.pop(context);
                            showBottonCode(context, textTheme);
                            
                          }),
                          child: Text(
                            'ادامه',
                            style: textTheme.displayMedium,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'کد را وارد کنید',
                        style: textTheme.headlineMedium,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '******',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: (() {
                            registerController.verify();
                            // Navigator.of(context).pushReplacement(
                            //     MaterialPageRoute(builder: ((context) {
                            //   return const MyCats();
                            // })));
                          }),
                          child: Text(
                            'ادامه',
                            style: textTheme.displayMedium,
                          )),
                    )
                  ]),
            ),
          );
        }));
  }
}
