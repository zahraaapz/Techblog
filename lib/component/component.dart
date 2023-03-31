import 'package:flutter/material.dart';
import 'package:tech_blog/component/color.dart';
import 'package:tech_blog/model.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var index;
    var textTheme;
    return Column(
      children: [
        Divider(
            thickness: 1.5, indent: size.width / 6, endIndent: size.width / 6),
        Hashtag(
          index: index,
          textTheme: textTheme,
          size: size,
        ),
      ],
    );
  }
}

class Hashtag extends StatelessWidget {
  Hashtag(
      {Key? key,
      required this.index,
      required this.textTheme,
      required this.size})
      : super(key: key);

  var index;
  var textTheme;
  var size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
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
              style: textTheme.headline1,
            )
          ],
        ),
      ),
    );
  }
}
