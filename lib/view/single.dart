import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tech_blog/component/component.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import '../controller/article_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/color.dart';

class Single extends StatelessWidget {
  const Single({super.key});

  @override
  Widget build(BuildContext context) {
    //var id=Get.argumentd[0];
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                    imageUrl: '',
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover)),
                      );
                    },
                    placeholder: (context, url) => const SpinKitCircle(
                          color: SolidColor.primary,
                          size: 32,
                        ),
                    errorWidget: (context, url, error) =>
                        Image.asset(Assets.images.singlePlaceHolder.path)),
                Positioned(
                  right: 0,
                  left: 0,
                  top: 0,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                            colors: GradientColor.singleAppbar)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        SizedBox(
                          width: 20,
                        ),
                       
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24,shadows: [Shadow(color: Colors.blueGrey),Shadow(color: Colors.black)],
                        ), Expanded(child: SizedBox()),
                        Icon(
                          Icons.bookmark_border_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('m',style:textStyle.bodyMedium),
        ),
        
        Row(children:[

            Image.asset(Assets.images.avatar.path,height:50),
           const SizedBox(width:16),

 Text('m',style:textStyle.bodyMedium),
        ]),
       HtmlWidget(
        'TTTTTTTT',
        onLoadingBuilder: (context, element, loadingProgress) => const SpinKitCircle(
                          color: SolidColor.primary,
                          size: 32,
                        ),
        textStyle: textStyle.displayLarge,
        enableCaching: true,)   ],
        ),
      ),
    );
  }
}
