import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/component/color.dart';
import 'package:tech_blog/component/component.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/Model/model.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width / 10,
              left: MediaQuery.of(context).size.width / 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.network(
                  Assets.images.techbot.path,
                  height: 100,
                ),
                Text(
                  'تبریک میگم لطفا اطلاعات ثبت نام وارد کن',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: 'نام و نام خانوادگی',
                      hintStyle: Theme.of(context).textTheme.headlineMedium),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'دسته بندی های مورد علاقه انتخاب کن',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: SizedBox(
                    height: 85,
                    width: double.infinity,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: listTag.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 3,
                        crossAxisSpacing: 5,
                        crossAxisCount: 2,
                        childAspectRatio: 0.3,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (favouritlist
                                  .contains(listTag[index].title)) {
                                favouritlist.add(Model(title: listTag[index].toString()));
                              }
                            });
                          },
                          child: Hashtag(
                        
                            index: index, size: size,
                          
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Image.asset(
                  Assets.images.techblog.path,
                  scale: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: SizedBox(
                    height: 85,
                    width: double.infinity,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: favouritlist.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 3,
                        crossAxisSpacing: 5,
                        crossAxisCount: 2,
                        childAspectRatio: 0.3,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        favouritlist;
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
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  favouritlist[index].title,
                                  style: textTheme.displayLarge,
                                ),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        favouritlist.removeAt(index);
                                      });
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.grey,
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
