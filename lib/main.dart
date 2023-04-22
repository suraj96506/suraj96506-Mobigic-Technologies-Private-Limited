import "package:flutter/material.dart";
import 'package:get/get.dart';

import 'Screens/splashScreen/splashscreen_view.dart';



void main() {
  runApp(MaterialApp(
      
      title: "Application",
      home: const SplashScreen(),
      theme: ThemeData(
        elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll<Color>(Color(0xff1CA9C9)))),
        primaryColor: const Color(0xff1CA9C9),
        buttonTheme: const ButtonThemeData(buttonColor: Color(0xff1CA9C9)),
        
      ),
      useInheritedMediaQuery: true,
      locale:Get.deviceLocale,
      debugShowCheckedModeBanner: false,
    ),);
}

