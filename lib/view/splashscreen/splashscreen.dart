import 'dart:async';
import 'dart:developer';

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
    log(widget.token!);
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
    return AnimatedContainer(
      duration: const Duration(microseconds: 200),
      child: Container(
          color: Colors.white, child: Image.asset("images/animagie_logo.png")),
    );
  }
}
