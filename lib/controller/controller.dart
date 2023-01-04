import 'dart:io';

import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../config/colorconfig.dart';

class Controller extends GetxController {
  // final growableList =
  //   List<int>.generate(9, (int index) => index * index, growable: false);

  RxList<bool> data = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;
  RxString email = ''.obs;
  RxString Fbemail = ''.obs;
  // var selectingCategories = List<dynamic>.empty(growable: true).obs;

  // var selectingCategories = List<bool>.generate(20, (index) => false);
  // var isvisible =
  //     List<int>.generate(20, (int index) => index * index, growable: false);
  RxBool visible = false.obs;
  List Home_Post = [
    "images/Cats.jpg",
    "images/Dogs.jpg",
    "images/Exotic_Birds.jpg",
    "images/Fishes.jpg",
    "images/horse.jpg",
    "images/Livestock.jpg",
    "images/Mammals.jpg",
    "images/Poultry.jpg",
    "images/Reptiles_and_Amphibians.jpg",
  ];
  Rx<int> selectedIndex = 0.obs;
  RxBool posttype_bool = true.obs;
  RxBool podcastposttype_bool = true.obs;

  ///club file picker locally
  File clubprofileimage = File("");
  File clubbackgroundimage = File("");

  ///clubfilepicker globally
  File clubglobalprofileimage = File("");
  File clubglobalbackgroundimage = File("");

  ///profile filepicker locally

  ///profile filepicker globally
  // File pFglobalprofileimage = File("");
  // File profileglobalbackgroundimage = File("");

  ///myclubs

  // List communitylistimage = [];
  RxBool chatoption = false.obs;
  //
  RxBool profilechangebool = false.obs;
  RxBool appoinmentdetailshide = true.obs;
  RxBool podcastplayblutton = false.obs;

  File file = File("");
  Rx<FilepickerType> imagevideo = FilepickerType(type: "", url: "").obs;
  // VideoPlayerController? videocontroller;

  // communityNext(title, fun) {
  //   return GestureDetector(
  //     onTap: () {
  //       fun;
  //       // Get.to(fun);
  //     },
  //     child: Container(
  //       height: 43,
  //       width: 310,
  //       decoration: BoxDecoration(
  //           color: buttonColor1_CL, borderRadius: BorderRadius.circular(15)),
  //       alignment: Alignment.center,
  //       child: Text(
  //         title,
  //         style: GoogleFonts.poppins(
  //           textStyle: const TextStyle(
  //             fontSize: 18,
  //             color: SigninButton_CL,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // clubapp(title, fun, context) {
  //   return Material(
  //     elevation: 3,
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       child: Row(children: [
  //         IconButton(
  //           icon: Icon(
  //             Icons.arrow_back_ios_new,
  //             size: 12.0.sp,
  //           ),
  //           onPressed: () {
  //             Get.to(fun);
  //           },
  //         ),
  //         Expanded(child: SizedBox()),
  //         Padding(
  //           padding: const EdgeInsets.only(left: 30.0),
  //           child: Text(
  //             title,
  //             style: GoogleFonts.poppins(
  //               textStyle: TextStyle(
  //                 fontSize: 10.5.sp,
  //                 color: Colors.black,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //         ),
  //         Expanded(child: Container()),
  //         Search_UI(),
  //         Notification_UI(),
  //         SizedBox(
  //           width: 3.0.wp,
  //         )
  //       ]),
  //     ),
  //   );
  // }

  // chatapp(title, fun, context) {
  //   return Material(
  //     elevation: 3,
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       child: Row(children: [
  //         IconButton(
  //           icon: Icon(
  //             Icons.arrow_back_ios_new,
  //             size: 12.0.sp,
  //           ),
  //           onPressed: () {
  //             Get.to(fun);
  //           },
  //         ),
  //         Flexible(child: Container()),
  //         SizedBox(
  //           width: 45,
  //         ),
  //         Text(
  //           title,
  //           style: GoogleFonts.poppins(
  //             textStyle: TextStyle(
  //               fontSize: 10.5.sp,
  //               color: Colors.black,
  //               fontWeight: FontWeight.w500,
  //             ),
  //           ),
  //         ),
  //         Flexible(child: Container()),
  //         Flexible(child: Container()),
  //       ]),
  //     ),
  //   );
  // }

  // podcastapp(title, fun, context) {
  //   return Material(
  //     elevation: 3,
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       child: Row(children: [
  //         IconButton(
  //           icon: Icon(
  //             Icons.arrow_back_ios_new,
  //             size: 12.0.sp,
  //           ),
  //           onPressed: () {
  //             Get.to(fun);
  //           },
  //         ),
  //         Flexible(child: Container()),
  //         SizedBox(
  //           width: 13.0.wp,
  //           //  45,
  //         ),
  //         Text(title),
  //         Flexible(child: Container()),
  //         Flexible(child: Container()),
  //         Notification_UI(),
  //         SizedBox(
  //           width: 2.0.wp,
  //         )
  //       ]),
  //     ),
  //   );
  // }

  chatscreenapp(title, fun, context) {
    return Material(
      elevation: 3,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          // Back_Button_UI(),
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 12.0.sp,
            ),
            onPressed: () {
              Get.to(fun);
            },
          ),
          Expanded(child: Container()),
          // Expanded(child: SizedBox()),

          Row(
            children: [
              CircleAvatar(
                radius: 13.0.sp,
                backgroundColor: animagiee_CL,
                child: CircleAvatar(
                  radius: 12.0.sp,
                  backgroundImage: const ExactAssetImage("images/Dogs.jpg"),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.5.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: () {
              if (chatoption.value == false) {
                chatoption.value = true;
              } else {
                chatoption.value = false;
              }
            },
            child: SizedBox(
              height: 2.0.hp,
              // 16,
              width: 5.0.wp,
              // 16,
              child: Image.asset(
                "images/burger.png",
              ),
            ),
          ),
          SizedBox(
            width: 4.0.wp,
          )
        ]),
      ),
    );
  }
}

class FilepickerType {
  String? type;
  String? url;
  FilepickerType({this.type, this.url});
}
