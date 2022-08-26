import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';

import '../createpost/usercreatepost.dart';
import '../doctor/doctor.dart';
import '../profilepage/myprofile.dart';
import 'adminpost.dart';
import '../homeAppBar/appbar.dart';
import '../bottombarfile/bottomnavibar.dart';
import '../communitypage/communitypage.dart';
import 'createpost.dart';
import 'homepagewidget.dart';

class Home_Page extends StatefulWidget {
  Home_Page({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  // List icon = [
  //   Icons.home_outlined,
  //   Icons.group,
  //   Icons.add_circle_outline,
  //   Icons.person_outline,
  //   Icons.person_outline,
  // ];
  // bool b1 = true;
  // bool b2 = false;
  // bool b3 = false;
  // bool b4 = false;
  // bool b5 = false;
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  Controller controller = Get.put(Controller());

  List wid = [
    Homepage_Wid(),
    Community_Page_UI(),
    UserProfile_CreatePost_UI(),
    Doctor(),
    My_Profile_UI()
  ];
  // int selectedIndex1 = 0;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          bottomNavigationBar: Customized_Bottom_Bar(),
          body: wid[controller.selectedIndex.value]),
    );
  }
}
