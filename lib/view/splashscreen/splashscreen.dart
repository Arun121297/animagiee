import 'dart:async';
import 'dart:developer';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/home.dart';
import 'package:animagieeui/view/homepage/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash_Screen extends StatefulWidget {
  String? token;
  Splash_Screen({required this.token});
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  Controller dashboardCOntroller = Get.put(Controller());
  @override
  void initState() {
    initialScreen();
    super.initState();
  }

  initialScreen() {
    log(widget.token ?? '');
    dashboardCOntroller.selectedIndex(0);
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              (widget.token) == null ? SecondScreen() : Home_Page(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(microseconds: 200),
        child: Center(
          child: SizedBox(
            height: 36.50.hp,
            width: 80.00.wp,
            child: Image.asset("images/splash_logo.png"),
          ),
        ),
      ),
    );
  }
}
