import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tech_blog/component/color.dart';
import 'package:tech_blog/Model/model.dart';
import 'package:url_launcher/url_launcher.dart';

class TechDivider extends StatelessWidget {
 const TechDivider({
    Key? key,
    required this.size,
 
   
  }) : super(key: key);

  final Size size;
 final int index=0;


  @override
  Widget build(BuildContext context) {
 

    return Column(
      children: [
        Divider(
            thickness: 1.5, indent: size.width / 6, endIndent: size.width / 6),
        Hashtag(
          index: index,
       
          size: size,
        ),
      ],
    );
  }
}

class Hashtag extends StatelessWidget {
  const Hashtag(
      {Key? key,
      required this.index,
     
      required this.size})
      : super(key: key);

 final int index;
 
 final Size size;

  @override
  Widget build(BuildContext context) {
     var textTheme = Theme.of(context).textTheme;
    return Container(
      height: 60,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: GradientColor.tags,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8.0, 8, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '#',
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              listTag[index].title,
              style: textTheme.displayLarge,
            )
          ],
        ),
      ),
    );
  }
}

mylounchUrl(String url)  async {
var uri=Uri.parse(url);
// if(await canLaunchUrl(uri)){
// await launchUrl(uri);
// }
// else{
//  log('could not launch ${uri.toString()}');
// }  not ok

try{
await launchUrl(uri);
return true;
}
catch(e){
log(e.toString());
return false;
}
}


TextTheme textStyle=const TextTheme(
   displayLarge: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
              displaySmall: TextStyle(
                  color: SolidColor.colorTitle,
                  fontWeight: FontWeight.w300,
                  fontSize: 14),
              headlineMedium: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 14),
                  headlineLarge: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  ),
            
              displayMedium: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700)
);