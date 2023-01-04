import 'dart:io';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/profilepage/controller/editcontr/editController.dart';
import 'package:animagieeui/view/profilepage/controller/profilecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';

import '../../homeAppBar/view/appbar.dart';
import '../../homepage/view/homepage.dart';
import '../controller/editcontr/backgroundimagecontroller.dart';
import 'editprofileheader.dart';
import 'editprofiletextfield.dart';

class Edit_Profile_UI extends StatefulWidget {
  const Edit_Profile_UI({Key? key}) : super(key: key);

  @override
  State<Edit_Profile_UI> createState() => _Edit_Profile_UIState();
}

class _Edit_Profile_UIState extends State<Edit_Profile_UI> {
  EditScreenController editScreenController = Get.put(EditScreenController());
  ProfileBGImageController profileBGImageController =
      Get.put(ProfileBGImageController());
  ProfileController profileController = Get.put(ProfileController());
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() {
    Future.delayed(Duration.zero, () async {
      editScreenController.pFprofileimage = File("");
      profileBGImageController.profilebackgroundimage = File('');
      profileController.getProfile().then((value) async {
        var data = profileController.getprofiledata[0].data;
        editScreenController.about.text = data!.about ?? "";
        editScreenController.fname.text = data.firstName ?? "";
        editScreenController.lname.text = data.lastName ?? "";
        editScreenController.dob.text = data.dob ?? "";
        editScreenController.mNumber.text = data.mobNo ?? "";
        editScreenController.email.text = data.email ?? "";
        editScreenController.address.text = data.address ?? "";
        editScreenController.pincode.text = data.pinCode ?? "";
        editScreenController.gender(data.gender ?? "");
        // editScreenController.state(data.as)
        // editScreenController.pFprofileimage = File(data.profileicon.toString());
        // profileBGImageController.profilebackgroundimage =
        //     File(data.profilebackimg.toString());
      });
    });
  }

  updateProfile(context) {
    Future.delayed(Duration.zero, () async {
      await editScreenController.editprofileservicesection(
        context,
      );
      //bgimage Api
      await profileBGImageController.profileBgController(context);

      Get.back();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileController.isProfileLoading.value) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return Scaffold(
          // appBar: AppBar(centerTitle: true, title: Text("Profile")),
          body: SafeArea(
              child: Column(
            children: [
              // Edit_Profile_AppBar_UI(),
              AppbarContainer(
                title: "Edit Profile",
                logo: false,
                notification: false,
                search: false,
                searchfunction: true,
                searchfunctionclose: false,
                backarrow: true,
                notification_back_arrow: false,
                chat: false,
                edit: false,
                firstscreen: false,
                navipage: null,
                podcast: false,
                fun: Home_Page(),
              ),

              // controller.chatapp("Profile", Home_Page(), context),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(children: [
                  const Edit_Profile_Header_UI(),
                  const Edit_Profile_TextField_UI(),
                  SizedBox(height: 4.0.hp
                      // 37,
                      ),
                  GestureDetector(
                    onTap: () {
                      updateProfile(context);
                    },
                    child: Container(
                      height: 6.7.hp,
                      // 43,
                      width: 90.0.wp,
                      // 310,
                      decoration: BoxDecoration(
                          color: buttonColor1_CL,
                          borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.center,
                      child: Text(
                        "Save",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 16.0.sp,
                            color: SigninButton_CL,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.0.hp,
                  ),
                ]),
              ))
            ],
          )),
        );
      }
    });
  }
}
