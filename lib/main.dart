import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:high_five/SplashModule/view/splash_view.dart';
import 'package:high_five/utill/Constants/const_color.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primaryColor: ConstColors.onPrimaryColor,
          secondaryHeaderColor: ConstColors.onPrimaryColor),
      debugShowCheckedModeBanner: false,
      title: 'High Five',
      home: SplashView(),
    );
  }
}
