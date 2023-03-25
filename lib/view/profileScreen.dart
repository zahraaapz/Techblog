// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tech_blog/color.dart';
import 'package:tech_blog/component.dart';
import '../gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Image(
            image: Assets.images.avatar,
            height: 90,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                Assets.images.pen,
                color: Solidcolor.colortitle,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'ویرایش عکس پروفایل',
                style: textTheme.headline3,
              )
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            'فاطمه امیری',
            style: textTheme.headline4,
          ),
          Text('fatemehAmiri@gmail.com', style: textTheme.headline4),
          const SizedBox(
            height: 40,
          ),
          TechDivider(size: size),
          InkWell(
            onTap: (() {}),
            splashColor: Solidcolor.primary,
            child: SizedBox(
              height: 45,
              child: Center(
                  child: Text(
                'مقالات مورد علاقه من',
                style: textTheme.headline4,
              )),
            ),
          ),
          TechDivider(size: size),
          InkWell(
            onTap: (() {}),
            splashColor: Solidcolor.primary,
            child: SizedBox(
              height: 45,
              child: Center(
                  child: Text(
                'پادکست های مورد علاقه من',
                style: textTheme.headline4,
              )),
            ),
          ),
          TechDivider(size: size),
          InkWell(
            onTap: (() {}),
            splashColor: Solidcolor.primary,
            child: SizedBox(
              height: 45,
              child: Center(
                  child: Text(
                'خروج از حساب کاربری',
                style: textTheme.headline4,
              )),
            ),
          ),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
