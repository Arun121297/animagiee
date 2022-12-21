import 'dart:io';

import 'package:animagieeui/view/doctor/view/doctorprofiless/header.dart';
import 'package:animagieeui/view/homeAppBar/view/appbar.dart';
import 'package:animagieeui/view/profilepage/controller/editcontr/backgroundimagecontroller.dart';
import 'package:animagieeui/view/profilepage/controller/profilecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../controller/controller.dart';
import '../../bottombarfile/view/bottomnavibar.dart';
// import '../bottombarfile/view/bottomnavibar.dart';
import '../controller/editcontr/editController.dart';
import 'myprofileheader.dart';
import 'profileappbar.dart';

class My_Profile_UI extends StatefulWidget {
  const My_Profile_UI({Key? key}) : super(key: key);

  @override
  State<My_Profile_UI> createState() => _My_Profile_UIState();
}

class _My_Profile_UIState extends State<My_Profile_UI> {
  ProfileController profileController = Get.put(ProfileController());
  ProfileBGImageController profileBGImageController =
      Get.put(ProfileBGImageController());
  EditScreenController editScreenController = Get.put(EditScreenController());
  Controller controller = Get.put(Controller());
  @override
  void initState() {
    // TODO: implement initState
    fetchdata();
    super.initState();
  }

  fetchdata() async {
    await profileController.profilecontrollerfunction();
    profileBGImageController.profilebackgroundimage = File('');
    editScreenController.pFprofileimage = File('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Customized_Bottom_Bar(),
      body: Obx(() {
        // Obx(() {
        if (profileController.profileloadingindecator.value == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return WillPopScope(
            onWillPop: () {
              return null!;
            },
            child: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    AppbarContainer(
                      edit: true,
                      notification: false,
                      navipage: 0,
                      backarrow: false,
                      chat: false,
                      searchfunction: true,
                      searchfunctionclose: false,
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
      }),
    );
  }
}
