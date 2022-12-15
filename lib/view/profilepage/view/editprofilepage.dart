import 'dart:io';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/data/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';

import '../../homeAppBar/view/appbar.dart';
import '../../homepage/view/homepage.dart';
import 'addDocument.dart';
import 'editprofileappbar.dart';
import 'editprofileheader.dart';
import 'editprofiletextfield.dart';

class Edit_Profile_UI extends StatefulWidget {
  const Edit_Profile_UI({Key? key}) : super(key: key);

  @override
  State<Edit_Profile_UI> createState() => _Edit_Profile_UIState();
}

class _Edit_Profile_UIState extends State<Edit_Profile_UI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(centerTitle: true, title: Text("Profile")),
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            // Edit_Profile_AppBar_UI(),
            AppbarContainer(
              title: "Profile",
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
              child: Container(
                child: Column(children: [
                  Edit_Profile_Header_UI(),
                  Edit_Profile_TextField_UI(),
                  SizedBox(height: 4.0.hp
                      // 37,
                      ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        controller.pFglobalprofileimage =
                            File(controller.pFprofileimage.path);
                        controller.profileglobalbackgroundimage =
                            File(controller.profilebackgroundimage.path);
                      });
                      Get.to(Home_Page());
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
              ),
            ))
          ],
        ),
      )),
    );
  }
}
