import 'package:flutter/material.dart';

class AppConfig {
  BuildContext context;
  double height = 30;
  double width = 30;
  AppConfig(this.context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    // AppBar().preferredSize.height
    //     -
    //     MediaQuery.of(context).viewPadding.top
  }
}
