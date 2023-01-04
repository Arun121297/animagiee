import 'dart:io';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/profilepage/controller/editcontr/backgroundimagecontroller.dart';
import 'package:animagieeui/view/profilepage/controller/editcontr/editController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';
import '../controller/profilecontroller.dart';

class Edit_Profile_Header_UI extends StatefulWidget {
  const Edit_Profile_Header_UI({Key? key}) : super(key: key);

  @override
  State<Edit_Profile_Header_UI> createState() => _Edit_Profile_Header_UIState();
}

class _Edit_Profile_Header_UIState extends State<Edit_Profile_Header_UI> {
  Controller controller = Get.put(Controller());
  ProfileController profileController = Get.put(ProfileController());
  EditScreenController editScreenController = Get.put(EditScreenController());
  ProfileBGImageController profileBGImageController =
      Get.put(ProfileBGImageController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.black,
      height: 22.0.hp,
      //  168,
      child: Stack(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              if (profileBGImageController.profilebackgroundimage.path ==
                  '') ...[
                if (profileController.getprofiledata[0].data!.profilebackimg ==
                    '') ...[
                  Container(
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                        color: animagiee_CL,
                        // image: const DecorationImage(
                        //     image: ExactAssetImage("images/emptyimage.jfif"),
                        //     fit: BoxFit.cover),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    width: MediaQuery.of(context).size.width,
                    height: 14.0.hp,

                    //  108,
                  ),
                ] else ...[
                  Container(
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                        // color: Colors.transparent,
                        image: DecorationImage(
                            image: NetworkImage(profileController
                                    .getprofiledata[0].data!.profilebackimg ??
                                ""),
                            fit: BoxFit.cover),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    width: MediaQuery.of(context).size.width,
                    height: 14.0.hp,

                    //  108,
                  ),
                ]
              ] else ...[
                Container(
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                          image: FileImage(
                              profileBGImageController.profilebackgroundimage),
                          fit: BoxFit.cover),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  width: MediaQuery.of(context).size.width,
                  height: 14.0.hp,

                  //  108,
                ),
              ],
              // Container(
              //   decoration: BoxDecoration(
              //       color: Colors.transparent,
              //       image: DecorationImage(
              //           image: FileImage(controller.profilebackgroundimage),
              //           fit: BoxFit.cover),
              //       borderRadius: const BorderRadius.only(
              //           bottomLeft: Radius.circular(15),
              //           bottomRight: Radius.circular(15))),
              //   width: MediaQuery.of(context).size.width,
              //   height: 14.0.hp,

              //   //  108,
              // ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                width: MediaQuery.of(context).size.width,
                height: 14.0.hp,
                //  108,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  profileBackgroundfilepicker();
                });
              },
              child: SizedBox(
                height: 6.0.hp,
                width: 9.0.wp,
                child: Image.asset("images/edit.png"),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(48.0.sp),
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.only(
                    left: 30.0.sp,
                  ),
                  margin: EdgeInsets.only(left: 30.0.sp),
                  child: Text(
                    "MY Profile",
                    style: GoogleFonts.jost(
                      textStyle: TextStyle(
                        fontSize: 19.5.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
              SizedBox(
                width: 3.0.wp,
              ),
              SizedBox(
                  height: 6.0.hp,
                  width: 9.0.wp,
                  child: Image.asset("images/edit.png")),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30.0.sp, left: 15.0.sp),
          child: Align(
            heightFactor: 1.4,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                if (editScreenController.pFprofileimage.path == '') ...[
                  if (profileController.getprofiledata[0].data!.profileicon ==
                      ''
                  // .getProfilemodel[0].data!.profilePicture ==
                  ) ...[
                    CircleAvatar(
                        radius: 42.0.sp,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          backgroundImage:
                              const ExactAssetImage("images/emptyimage.jfif"),
                          radius: 40.0.sp,
                        ))
                  ] else ...[
                    CircleAvatar(
                      radius: 42.0.sp,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(profileController
                            .getprofiledata[0].data!.profileicon
                            .toString()),
                        // backgroundColor: animagiee_CL,
                        radius: 40.0.sp,
                      ),
                    )
                  ]
                ] else ...[
                  CircleAvatar(
                    radius: 42.0.sp,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundImage:
                          FileImage(editScreenController.pFprofileimage),
                      // backgroundColor: animagiee_CL,
                      radius: 40.0.sp,
                    ),
                  )
                ],
                // CircleAvatar(
                //     radius: 42.0.sp,
                //     backgroundColor: Colors.white,
                //     child: controller.pFprofileimage.path.isEmpty
                //         ? CircleAvatar(
                //             backgroundImage:
                //                 ExactAssetImage("images/emptyimage.jfif"),
                //             // backgroundColor: animagiee_CL,
                //             radius: 40.0.sp,
                //           )
                //         : CircleAvatar(
                //             backgroundImage:
                //                 FileImage(controller.pFprofileimage),
                //             // backgroundColor: animagiee_CL,
                //             radius: 40.0.sp,
                //           )),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 80.0.sp),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(right: 35.0.sp, bottom: 10.0.sp),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    PFprofilefilepicker();
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
      ]),
    );
  }

  profileBackgroundfilepicker() async {
    final ImagePicker imagePicker = ImagePicker();

    final result = await imagePicker.pickImage(source: ImageSource.gallery);

    if (result != null) {
      setState(() {
        profileBGImageController.profilebackgroundimage = File(result.path);
      });
    } else {
      return null;
    }
  }

  PFprofilefilepicker() async {
    final ImagePicker imagePicker = ImagePicker();

    final result = await imagePicker.pickImage(source: ImageSource.gallery);

    if (result != null) {
      setState(() {
        editScreenController.pFprofileimage = File(result.path);
      });
    } else {
      return null;
    }
  }
}
