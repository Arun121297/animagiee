import 'package:animagieeui/view/splashscreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Splash Screen',
      // theme: ThemeData(primarySwatch: Colors.),
      home: Splash_Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
