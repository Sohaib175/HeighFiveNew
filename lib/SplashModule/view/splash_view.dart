import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/SplashModule/ViewModel/splash_vm.dart';
import 'package:high_five/utill/Constants/const_color.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);
  final SplashVM splashVM = Get.put(SplashVM());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.primaryColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.33,
              decoration: const BoxDecoration(
                color: Color(0xff122643),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(180),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.24,
              decoration: const BoxDecoration(
                color: Color(0xff172f4d),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(200),
                  topLeft: Radius.circular(200),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(0xff0d2646).withOpacity(0.9),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Splash Screen",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
