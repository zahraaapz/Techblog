import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/Route_manager/Named.dart';
import 'package:tech_blog/Route_manager/Pages.dart';
import 'package:tech_blog/Route_manager/binding.dart';
import 'package:tech_blog/component/constant/color.dart';
import 'package:tech_blog/component/component.dart';


void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  await GetStorage.init();

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
        initialRoute: NamedRoute.routeMain,
        initialBinding: RegisterBinding(),
        theme: lightTheme(textTheme),
        debugShowCheckedModeBanner: false,
        locale: const Locale('fa'),
        getPages: Pages.page);
  }

  ThemeData lightTheme(TextTheme textTheme) {
    return ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          hintStyle: textTheme.headlineMedium,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  const BorderSide(width: 3, color: SolidColor.colorTitle)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  const BorderSide(width: 3, color: SolidColor.primary)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((state) {
            if (state.contains(MaterialState.pressed)) {
              return SolidColor.primary;
            }

            return SolidColor.colorTitle;
          }), textStyle: MaterialStateProperty.resolveWith((state) {
            if (state.contains(MaterialState.pressed)) {
              return textTheme.headlineMedium;
            }
            return textTheme.displayMedium;
          })),
        ),
        fontFamily: 'dana',
        textTheme: textStyle);
  }
}
