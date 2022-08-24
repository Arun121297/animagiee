import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/colorconfig.dart';
import '../view/homeAppBar/backbutton.dart';
import '../view/homeAppBar/notification.dart';
import '../view/homeAppBar/search.dart';
import '../view/homepage/homepage.dart';

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

  ///myclubs
  List communitylist = [];
  RxBool chatoption = false.obs;
  //
  communityNext(fun) {
    return GestureDetector(
      onTap: () {
        Get.to(fun);
      },
      child: Container(
        height: 43,
        width: 310,
        decoration: BoxDecoration(
            color: buttonColor1_CL, borderRadius: BorderRadius.circular(15)),
        alignment: Alignment.center,
        child: Text(
          "Next",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 18,
              color: SigninButton_CL,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  cusapp(title, context) {
    return Material(
      elevation: 3,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          Back_Button_UI(),
          Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(title),
          ),
          Expanded(child: Container()),
          Search_UI(),
          Notification_UI(),
        ]),
      ),
    );
  }

  chatapp(title, context) {
    return Material(
      elevation: 3,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          Back_Button_UI(),
          Flexible(child: Container()),
          // Expanded(child: SizedBox()),
          SizedBox(
            width: 45,
          ),
          Text(title),
          Flexible(child: Container()),
          Flexible(child: Container()),

          // Expanded(child: Container()),
          // Search_UI(),
          // Notification_UI(),
        ]),
      ),
    );
  }

  chatscreenapp(title, context) {
    return Material(
      elevation: 3,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          Back_Button_UI(),
          Expanded(child: Container()),
          // Expanded(child: SizedBox()),

          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: animagiee_CL,
                child: CircleAvatar(radius: 15),
              ),
              SizedBox(
                width: 10,
              ),
              Text(title),
            ],
          ),
          Expanded(child: Container()),
          IconButton(
              onPressed: () {
                if (chatoption.value == false) {
                  chatoption.value = true;
                } else {
                  chatoption.value = false;
                }
              },
              icon: Icon(Icons.menu))
        ]),
      ),
    );
  }
}
