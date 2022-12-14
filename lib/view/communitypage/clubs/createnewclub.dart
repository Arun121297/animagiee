import 'dart:io';

import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';

import 'package:animagieeui/view/communitypage/clubs/completedclub.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/controller.dart';

import '../../homeAppBar/appbar.dart';
import 'myclubs.dart';

class Create_New_Club_UI extends StatefulWidget {
  const Create_New_Club_UI({Key? key}) : super(key: key);

  @override
  State<Create_New_Club_UI> createState() => _Create_New_Club_UIState();
}

class _Create_New_Club_UIState extends State<Create_New_Club_UI> {
  Controller controller = Get.put(Controller());
  String communitydropdownValue = 'Dog';
  String communityTypedropdownValue = 'Private';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // bottomNavigationBar: Customized_Bottom_Bar(),
      body: SafeArea(
        child: Column(children: [
          AppbarContainer(
            title: "Create New Club",
            backarrow: true,
            firstscreen: false,
            notification_back_arrow: false,
            searchfunction: true,
            searchfunctionclose: false,
            navipage: null,
            notification: true,
            edit: false,
            search: true,
            chat: false,
            logo: false,
            podcast: false,
            fun: MyClubs_UI(),
          ),

          SizedBox(
            height: 20.0.hp,
            // 150,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: controller.clubbackgroundimage.path.isEmpty
                          ? animagiee_CL
                          : Colors.transparent,
                      image: DecorationImage(
                          image: FileImage(
                            controller.clubbackgroundimage,
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  width: MediaQuery.of(context).size.width,
                  height: 14.0.hp,

                  //  108,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  width: MediaQuery.of(context).size.width,
                  height: 14.0.hp,
                  //  108,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 33.0.sp),
                  child: Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 65.0.sp,
                      backgroundColor: Colors.white,
                      child: controller.clubprofileimage.path.isEmpty
                          ? CircleAvatar(
                              radius: 45.0.sp,
                              backgroundColor: animagiee_CL,
                              child: SizedBox(
                                height: 7.0.hp,
                                // 37,
                                width: 10.0.wp,
                                // 37,
                                child: Image.asset(
                                  "images/clubcreateprofile.png",
                                ),
                              ),
                            )
                          : CircleAvatar(
                              radius: 45.0.sp,
                              backgroundImage:
                                  FileImage(controller.clubprofileimage),
                              // backgroundColor: Colors.yellow,
                            ),

                      // CircleAvatar(
                      //   child: controller.clubprofileimage == null
                      //       ? SizedBox(
                      //           height: 7.0.hp,
                      //           // 37,
                      //           width: 10.0.wp,
                      //           // 37,
                      //           child: Image.asset(
                      //             "images/clubcreateprofile.png",
                      //           ))
                      //       : Image.file(controller.clubprofileimage,
                      //           fit: BoxFit.cover),
                      //   backgroundColor: animagiee_CL,
                      //   radius: 45.0.sp,
                      // ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          backgroundfilepicker();
                        });
                      },
                      child: SizedBox(
                          height: 6.0.hp,
                          width: 9.0.wp,
                          child: Image.asset("images/edit.png")),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  top: 35.0.sp,
                  child: Padding(
                    padding: EdgeInsets.only(top: 50.0.sp, left: 80.0.sp),
                    child: Align(
                      heightFactor: 5,
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            filepicker();
                          });
                        },
                        child: SizedBox(
                            height: 6.0.hp,
                            width: 9.0.wp,
                            child: Image.asset("images/edit.png")),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 70.0.wp,
            //  258,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Group Name",
                floatingLabelAlignment: FloatingLabelAlignment.center,
                hintStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: club_Text_1,
                    fontSize: 9.0.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Club Name",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: club_Text_1,
                        fontSize: 10.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Card(
                    elevation: 3,
                    child: Container(
                        margin: EdgeInsets.only(left: 7.0.sp),
                        width: 88.0.wp,
                        height: 5.0.hp,
                        child: TextField(
                            decoration: new InputDecoration(
                          border: InputBorder.none,
                        )))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Club Description",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: club_Text_1,
                        fontSize: 10.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Card(
                    elevation: 3,
                    child: Container(
                        margin: EdgeInsets.only(left: 7.0.sp),
                        width: 88.0.wp,
                        height: 5.0.hp,
                        child: TextField(
                            decoration: new InputDecoration(
                          border: InputBorder.none,
                        )))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Community",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: club_Text_1,
                        fontSize: 10.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                ///dropdown
                Card(
                  elevation: 3,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 87.5.wp,
                    // 320,
                    height: 5.0.hp,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: communitydropdownValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      elevation: 16,
                      style: const TextStyle(
                          color: Color.fromRGBO(176, 176, 176, 1)),
                      underline: Container(
                        height: 2,
                        color: Colors.transparent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          communitydropdownValue = newValue!;
                        });
                      },
                      items: <String>['Dog', 'cat', 'birds', 'insects']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                ///
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Community Type",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: club_Text_1,
                            fontSize: 10.0.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      SizedBox(
                        height: 2.0.hp,
                        width: 4.0.wp,
                        // 13,
                        child: Image.asset(
                          "images/about.png",
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 87.0.wp,
                    height: 5.0.hp,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: communityTypedropdownValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      elevation: 16,
                      style: const TextStyle(
                          color: Color.fromRGBO(176, 176, 176, 1)),
                      underline: Container(
                        height: 2,
                        color: Colors.transparent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          communityTypedropdownValue = newValue!;
                        });
                      },
                      items: <String>['Private', 'Public']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          // controller.communityNext("Create", Completed_Club_UI())
          controller.communityNext("Create", MyClubs_UI())
        ]),
      ),
    );
  }

  filepicker() async {
    final ImagePicker imagePicker = ImagePicker();

    final result = await imagePicker.pickImage(source: ImageSource.gallery);

    if (result != null) {
      setState(() {
        controller.clubprofileimage = File(result.path);
        // controller.file = File(result.path);
        // controller.imagevideo(FilepickerType(type: "image", url: result.path));
      });
    } else {
      return null;
    }
  }

  backgroundfilepicker() async {
    final ImagePicker imagePicker = ImagePicker();

    final result = await imagePicker.pickImage(source: ImageSource.gallery);

    if (result != null) {
      setState(() {
        controller.clubbackgroundimage = File(result.path);
        // controller.file = File(result.path);
        // controller.imagevideo(FilepickerType(type: "image", url: result.path));
      });
    } else {
      return null;
    }
  }
}
