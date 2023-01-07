import 'dart:developer';
import 'dart:io';

import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/club/controllers/club_controller.dart';

import 'package:animagieeui/view/instancepage/controller/clubIconController.dart';
import 'package:animagieeui/view/instancepage/controller/instancecontroller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../controller/controller.dart';
import '../../../../homeAppBar/view/appbar.dart';
import 'mycreatedclub.dart';

class EditandDeleteMyClub extends StatefulWidget {
  const EditandDeleteMyClub({Key? key}) : super(key: key);

  @override
  State<EditandDeleteMyClub> createState() => _EditandDeleteMyClubState();
}

class _EditandDeleteMyClubState extends State<EditandDeleteMyClub> {
  Controller controller = Get.put(Controller());
  InstanceContoroller instanceContoroller = Get.put(InstanceContoroller());
  ClubController clubController = Get.put(ClubController());
  ClubIconController clubIconController = Get.put(ClubIconController());
  String communitydropdownValue = '';
  String communityTypedropdownValue = '';
  List communityList = [];
  @override
  void initState() {
    clubController.clubDescription.text = '';
    clubController.clubName.text = '';
    clubController.groupName.text = '';
    clubController.id = '';
    // clubController.pFprofileimage = File('');
    clubController.communityTypeisPrivate = false.obs;
    clubController.communityTypeisPrivat = ''.obs;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // bottomNavigationBar: Customized_Bottom_Bar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            AppbarContainer(
              title: "Edit Club",
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
              fun: MyClubCreation(),
            ),
            SizedBox(
              height: 20.0.hp,
              // 150,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: clubIconController
                                .profilebackgroundimage.path.isEmpty
                            ? animagiee_CL
                            : Colors.transparent,
                        image: DecorationImage(
                            image: FileImage(
                              clubIconController.profilebackgroundimage,
                            ),
                            fit: BoxFit.cover),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    width: MediaQuery.of(context).size.width,
                    height: 14.0.hp,

                    //  108,
                  ),
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
                  Padding(
                    padding: EdgeInsets.only(top: 33.0.sp),
                    child: Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 65.0.sp,
                        backgroundColor: Colors.white,
                        child: clubController.pFprofileimage.path.isEmpty
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
                                    FileImage(clubController.pFprofileimage),
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
                            // backgroundfilepicker();
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
                              // filepicker();
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
            SizedBox(
              width: 70.0.wp,
              //  258,
              child: TextField(
                controller: clubController.groupName,
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
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
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
                              controller: clubController.clubName,
                              decoration: const InputDecoration(
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
                              controller: clubController.clubDescription,
                              decoration: const InputDecoration(
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
                      margin: const EdgeInsets.only(left: 10),
                      width: 87.5.wp,
                      // 320,
                      height: 5.0.hp,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: clubController.id.isEmpty
                            ? null
                            : clubController.id,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        elevation: 16,
                        style: const TextStyle(
                            color: Color.fromRGBO(176, 176, 176, 1)),
                        underline: Container(
                          height: 2,
                          color: Colors.transparent,
                        ),
                        items: instanceContoroller.getinstancedata.isEmpty
                            ? null
                            : instanceContoroller.getinstancedata[0].data!
                                .map<DropdownMenuItem<String>>((data) {
                                return DropdownMenuItem<String>(
                                  value: data.id,
                                  child: Text(data.communityName.toString()),
                                );
                              }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            log(clubController.id);
                            clubController.id = (newValue ?? '');
                          });
                        },
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
                        const SizedBox(
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
                      margin: const EdgeInsets.only(left: 10),
                      width: 87.0.wp,
                      height: 5.0.hp,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: clubController.communityTypeisPrivat.value == ''
                            ? null
                            : clubController.communityTypeisPrivat.value,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        elevation: 16,
                        style: const TextStyle(
                            color: Color.fromRGBO(176, 176, 176, 1)),
                        underline: Container(
                          height: 2,
                          color: Colors.transparent,
                        ),
                        onChanged: (String? newValue) {
                          clubController.communityTypeisPrivat(newValue);
                          setState(() {
                            log(clubController.communityTypeisPrivate
                                .toString());
                            if (newValue == 'Private') {
                              clubController.communityTypeisPrivate(true);
                            } else {
                              clubController.communityTypeisPrivate(false);
                            }
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
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Get.to(const EditandDeleteMyClub());
                // clubController.clubApi();
                // clubIconController.clubIconApi();
              },
              child: Container(
                height: 43,
                width: 310,
                decoration: BoxDecoration(
                    color: buttonColor1_CL,
                    borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: Text(
                  "Update",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: SigninButton_CL,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Delete Group",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 10.0.sp,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.0.hp,
            )
          ]),
        ),
      ),
    );
  }

  filepicker() async {
    final ImagePicker imagePicker = ImagePicker();

    final result = await imagePicker.pickImage(source: ImageSource.gallery);

    if (result != null) {
      setState(() {
        clubController.pFprofileimage = File(result.path);
        log(clubController.pFprofileimage.path);
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
        clubIconController.profilebackgroundimage = File(result.path);
        log("${clubIconController.profilebackgroundimage}");
        // controller.file = File(result.path);
        // controller.imagevideo(FilepickerType(type: "image", url: result.path));
      });
    } else {
      return null;
    }
  }
}
