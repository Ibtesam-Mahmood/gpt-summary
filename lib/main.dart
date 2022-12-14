import 'dart:math';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:gpt_summary/pages/main_page.dart';

void main() {

  // randomly select a theme index
  // final int themeIndex = Random().nextInt(FlexScheme.values.length);

  runApp(const MyApp(/*themeIndex: themeIndex*/));
}

class MyApp extends StatelessWidget {

  // final int themeIndex;

  const MyApp({super.key, /* required this.themeIndex */});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  final int themeIndex = Random().nextInt(FlexScheme.values.length);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: FlexThemeData.light(
        scheme: FlexScheme.values[themeIndex],
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 20,
        appBarOpacity: 0.95,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          blendOnColors: false,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.values[themeIndex],
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarStyle: FlexAppBarStyle.background,
        appBarOpacity: 0.90,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 30,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      themeMode: ThemeMode.system,
      home: const MainPage(),
    );
  }
}