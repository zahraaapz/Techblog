import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_blog/component/color.dart';
import 'package:tech_blog/view/my-cat.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      theme: ThemeData(
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
          textTheme: const TextTheme(
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
              displayMedium: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700))),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', '') //farsi
      ],
      home: const MyCats(),
    );
  }
}
