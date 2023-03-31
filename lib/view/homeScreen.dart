// ignore_for_file: file_names

import 'package:tech_blog/component/color.dart';
import 'package:tech_blog/model.dart';
import 'package:flutter/material.dart';
import '../gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(children: [
        posterImage(),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: tagList(size: size, textTheme: textTheme),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: 10.0, right: size.width / 10, bottom: 8),
          child: Row(
            children: [
              ImageIcon(
                Assets.images.pen,
                color: Solidcolor.colortitle,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'مشاهده داغ ترین نوشته ها',
                style: textTheme.headline3,
              )
            ],
          ),
        ),
        blogList(),
        Padding(
          padding: EdgeInsets.only(right: size.width / 10),
          child: Row(
            children: [
              ImageIcon(Assets.images.mic, color: Solidcolor.colortitle),
              const SizedBox(
                width: 8,
              ),
              Text(
                'مشاهده داغ ترین پادکست ها',
                style: textTheme.headline3,
              )
            ],
          ),
        ),
        podcastList(),
        const SizedBox(
          height: 60,
        )
      ]),
    );
  }

  SizedBox podcastList() {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? size.width / 10 : 15, top: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: size.height / 5.3,
                      width: size.width / 2.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.black),
                    ),
                  ),
                  const Text('data')
                ],
              ),
            );
          })),
    );
  }

  SizedBox blogList() {
    return SizedBox(
      height: size.height / 3.3,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: blogModelList.getRange(0, 6).length,
          itemBuilder: ((context, index) {
            return Padding(
              padding:
                  EdgeInsets.only(right: index == 0 ? size.width / 10 : 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(children: [
                      Container(
                        height: size.height / 5.3,
                        width: size.width / 2.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    blogModelList[index].imageUrl))),
                        foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                                colors: GradientColor.blog,
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)),
                      ),
                      Positioned(
                        bottom: 8,
                        child: SizedBox(
                          width: size.width / 2.4,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(blogModelList[index].writer,
                                    style: textTheme.headline1),
                                Row(
                                  children: [
                                    Text(
                                      blogModelList[index].views,
                                      style: textTheme.headline1,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.white,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    width: size.width / 2.4,
                    child: Text(
                      blogModelList[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            );
          })),
    );
  }

  Stack posterImage() {
    return Stack(
      children: [
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image(image: Assets.images.programming).image)),
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  colors: GradientColor.poster,
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter)),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: size.width / 10,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'ملیکا عزیزی -یک روز پیش',
                    style: textTheme.headline1,
                  ),
                  Text(
                    'like 255',
                    style: textTheme.headline1,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '  دوازده قدم برنامه نویسی یک دوره ی....',
                    style: textTheme.headline2,
                    textAlign: TextAlign.right,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class tagList extends StatelessWidget {
  const tagList({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listTag.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? size.width / 10 : 15, top: 5),
              child: Container(
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
              ),
            );
          },
        ));
  }
}
