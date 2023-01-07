import 'dart:developer';
import 'dart:io';

import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';

import 'package:animagieeui/view/communitypage/view/clubs/completedclub.dart';
import 'package:animagieeui/view/homepage/view/homepage.dart';
import 'package:animagieeui/view/homepage/view/homepagewidget.dart';
import 'package:animagieeui/view/instancepage/controller/clubController.dart';
import 'package:animagieeui/view/instancepage/controller/clubIconController.dart';
import 'package:animagieeui/view/instancepage/controller/instancecontroller.dart';
import 'package:animagieeui/view/instancepage/model/instancemodel.dart';
import 'package:animagieeui/view/profilepage/view/loader/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../controller/controller.dart';
import '../../../../../data/pages.dart';
import '../../../../../utils/constance.dart';
import '../../../../homeAppBar/view/appbar.dart';
import '../../../../instancepage/controller/communityController.dart';
import '../../../controller/editclubbgcontroller.dart';
import '../../../controller/editclubcontroller.dart';
import 'mycreatedclub.dart';

class EditandDeleteMyClub extends StatefulWidget {
  var id;
  var clubname;
  var desc;
  var groupname;
  var isprivate;
  var isprivatestring;
  var communitie;
  var icon;
  var bgicon;
  EditandDeleteMyClub(
      {Key? key,
      this.clubname,
      this.desc,
      this.icon,
      this.bgicon,
      this.groupname,
      this.id,
      this.isprivate,
      this.isprivatestring,
      this.communitie})
      : super(key: key);

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
  EditClubController editClubController = Get.put(EditClubController());
  EditClubbgController editClubbgController = Get.put(EditClubbgController());

  CommunityProfileContoller communityProfileContoller =
      Get.put(CommunityProfileContoller());
  String? userid;
  @override
  void initState() {
    fetchdata();

    super.initState();
  }

  fetchdata() {
    Future.delayed(Duration.zero, () async {
      editClubController.selectediconimage = File('');
      editClubbgController.selectedbgimage.value = File('');
      clubController.clubDescription.text = widget.desc;
      clubController.clubName.text = widget.clubname;
      clubController.groupName.text = widget.groupname;
      clubController.id = widget.communitie;
      clubController.pFprofileimage = File(widget.icon);
      clubIconController.profilebackgroundimage(File(widget.bgicon));
      clubController.communityTypeisPrivate.value = widget.isprivate!;
      clubController.communityTypeisPrivat.value = widget.isprivatestring;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var listdata = communityProfileContoller.communityData[0].data1![0];
    return Obx(() {
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
                    editClubbgController.selectedbgimage.value.path.isEmpty
                        ? clubIconController.profilebackgroundimage.value.path
                                .contains('https')
                            ? Container(
                                decoration: BoxDecoration(
                                    // color: animagiee_CL,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          clubIconController
                                              .profilebackgroundimage
                                              .value
                                              .path,
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                width: MediaQuery.of(context).size.width,
                                height: 14.0.hp,

                                //  108,
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    // color: animagiee_CL,
                                    image: DecorationImage(
                                        image: FileImage(File(
                                          clubIconController
                                              .profilebackgroundimage
                                              .value
                                              .path,
                                        )),
                                        fit: BoxFit.cover),
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                width: MediaQuery.of(context).size.width,
                                height: 14.0.hp,

                                //  108,
                              )
                        : Container(
                            decoration: BoxDecoration(
                                // color: animagiee_CL,
                                image: DecorationImage(
                                    image: FileImage(File(editClubbgController
                                        .selectedbgimage.value.path)),
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
                            child: editClubController
                                    .selectediconimage.path.isEmpty
                                ? clubController.pFprofileimage.path
                                        .contains('https')
                                    ? CircleAvatar(
                                        radius: 45.0.sp,
                                        backgroundImage: NetworkImage(
                                            clubController.pFprofileimage.path),
                                      )
                                    : CircleAvatar(
                                        radius: 45.0.sp,
                                        backgroundImage: FileImage(File(
                                            clubController
                                                .pFprofileimage.path)),
                                      )
                                : CircleAvatar(
                                    radius: 45.0.sp,
                                    backgroundImage: FileImage(File(
                                        editClubController
                                            .selectediconimage.path)),
                                    child: SizedBox(
                                      height: 7.0.hp,
                                      // 37,
                                      width: 10.0.wp,
                                    ),
                                  )),
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
                                controller: clubController.clubDescription,
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
                          value:
                              clubController.communityTypeisPrivat.value == ''
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
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  setState(() {
                    // loader();
                    editClubController.editclubcontroller(
                      ClubDescription: clubController.clubDescription.text,
                      Community: clubController.id,
                      clubicon:
                          editClubController.selectediconimage.path.isEmpty
                              ? clubController.pFprofileimage.path
                              : editClubController.selectediconimage.path,
                      clubid: widget.id,
                      CommunityTypeisPrivate:
                          clubController.communityTypeisPrivate.toString(),
                      groupName: clubController.groupName.text,
                      clubname: clubController.clubName.text,
                    );
                    editClubbgController.editclubbgcontroller(
                      clubicon: editClubbgController
                              .selectedbgimage.value.path.isEmpty
                          ? clubIconController.profilebackgroundimage.value.path
                          : editClubbgController.selectedbgimage.value.path,
                      clubid: widget.id,
                      ClubDescription: clubController.clubDescription.text,
                      Community: clubController.id,
                      CommunityTypeisPrivate:
                          clubController.communityTypeisPrivate.toString(),
                      groupName: clubController.groupName.text,
                      clubname: clubController.clubName.text,
                    );
                    log(clubController.pFprofileimage.toString());
                    log(
                      clubIconController.profilebackgroundimage.value.path,
                    );
                  });
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
              Divider(),
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
                    Icon(
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
    });
  }

  filepicker() async {
    final ImagePicker imagePicker = ImagePicker();

    final result = await imagePicker.pickImage(source: ImageSource.gallery);

    if (result != null) {
      setState(() {
        editClubController.selectediconimage = File(result.path);
        log("${editClubController.selectediconimage.path}");
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
        editClubbgController.selectedbgimage(File(result.path));
        log("${editClubbgController.selectedbgimage}");
        // controller.file = File(result.path);
        // controller.imagevideo(FilepickerType(type: "image", url: result.path));
      });
    } else {
      return null;
    }
  }

  // loader() {
  //   Future.delayed(Duration.zero, () async {
  //     await editClubController.editclubbgloadingindicator.value
  //         ? const Loader()
  //         : Get.back();
  //   });
  // }
}
