import 'package:animagieeui/view/doctor/doctorprofiless/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'myprofileheader.dart';
import 'profileappbar.dart';

class My_Profile_UI extends StatefulWidget {
  const My_Profile_UI({Key? key}) : super(key: key);

  @override
  State<My_Profile_UI> createState() => _My_Profile_UIState();
}

class _My_Profile_UIState extends State<My_Profile_UI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Profile_AppBar_UI(
                title: "Profile",
              ),
              MY_Profile_Header_UI()
            ],
          ),
        ),
      ),
    );
  }
}
