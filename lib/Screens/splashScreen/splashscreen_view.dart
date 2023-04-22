import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:mobigiccrossword/Screens/enterValue.dart';
import 'package:mobigiccrossword/Screens/splashScreen/stars.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
  
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
     Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (builder)=>const Entervalue()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [
                  Color(0xffCE6F1B),
                  Color(0xffE58631),
                  Color(0xffFFC590),
                ])),
            height: Get.height,
            width: Get.width,
          ),
          const Stars(),
          Positioned.fill(
              top: 185,
              left: 40,
              right: 246,
              bottom: 553,
              child: SvgPicture.asset(
                "assets/earth.svg",
                height: 100,
                width: 100,
                fit: BoxFit.scaleDown,
              )),
          Positioned.fill(
              left: 179,
              bottom: 600,
              child: SvgPicture.asset(
                "assets/planet2.svg",
                height: 250,
                width: 169,
                fit: BoxFit.scaleDown,
                colorFilter:
                    const ColorFilter.mode(Color(0xffF18A2E), BlendMode.srcIn),
              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  Image.asset(
                    "assets/gif.png",
                    scale: 3,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
