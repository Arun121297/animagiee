import 'dart:io';

import 'package:animagieeui/view/homeAppBar/view/appbar.dart';
import 'package:animagieeui/view/profilepage/controller/editcontr/backgroundimagecontroller.dart';
import 'package:animagieeui/view/profilepage/controller/profilecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/controller.dart';
import '../../bottombarfile/view/bottomnavibar.dart';
// import '../bottombarfile/view/bottomnavibar.dart';
import '../controller/editcontr/editController.dart';
import 'myprofileheader.dart';

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
    fetchData();
    super.initState();
  }

  fetchData() {
    Future.delayed(Duration.zero, () async {
      await profileController.getProfile();
    });

    profileBGImageController.profilebackgroundimage(File(''));
    editScreenController.pFprofileimage = File('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Customized_Bottom_Bar(),
      body: Obx(() {
        if (profileController.isProfileLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (profileController.profileData.isEmpty) {
          return const Center(
            child: Text("Something went wrong..."),
          );
        } else {
          return WillPopScope(
            onWillPop: () {
              return null!;
            },
            child: SafeArea(
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
                    firstscreen: false,
                    notification_back_arrow: false,
                    logo: false,
                    podcast: false,
                    search: false,
                    fun: null,
                    title: "Profile",
                  ),
                  const MY_Profile_Header_UI()
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
