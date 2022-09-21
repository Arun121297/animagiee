import 'package:animagieeui/view/splashscreen/splashscreen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Splash Screen',
    
      home: Splash_Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
