import 'package:animagieeui/view/doctor/doctorprofiless/header.dart';
import 'package:animagieeui/view/homeAppBar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../bottombarfile/bottomnavibar.dart';
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
      bottomNavigationBar: Customized_Bottom_Bar(),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              AppbarContainer(
                edit: true,
                notification: false,
                navipage: 0,
                backarrow: false,
                chat: false,
                firstscreen: true,
                notification_back_arrow: false,
                logo: false,
                podcast: false,
                search: false,
                fun: null,
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
