import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';
import 'myclubs.dart';

class Completed_Club_UI extends StatefulWidget {
  const Completed_Club_UI({Key? key}) : super(key: key);

  @override
  State<Completed_Club_UI> createState() => _Completed_Club_UIState();
}

class _Completed_Club_UIState extends State<Completed_Club_UI> {
  Controller controller = Get.put(Controller());
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // bottomNavigationBar: Customized_Bottom_Bar(),
      body: SafeArea(
        child: Column(children: [
          controller.clubapp("Create New Club", MyClubs_UI(), context),
          // Material(
          //   elevation: 3,
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     child: Row(children: [
          //       // Back_Button_UI(),
          //       IconButton(
          //           icon: Icon(
          //             Icons.arrow_back_ios_new,
          //             size: 12.0.sp,
          //           ),
          //           onPressed: () {
          //             Get.to(MyClubs_UI());
          //             // Get.to(Community_Page_UI());

          //             // },Community_Page_UI
          //           }),
          //       Expanded(child: SizedBox()),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 30.0),
          //         child: Text("My Club"),
          //       ),
          //       Expanded(child: Container()),
          //       Search_UI(),
          //       Notification_UI(),
          //     ]),
          //   ),
          // ),
          // controller.cusapp("Create New Club", context),
          SizedBox(
            height: 20.0.hp,
            // 150,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage("images/Dogs.jpg"),
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
                  padding: EdgeInsets.only(top: 40.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 65.0.sp,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundImage: ExactAssetImage("images/Dogs.jpg"),
                        // child: Image.asset(
                        //   "images/Dogs.jpg",
                        //   // cacheHeight: 37,
                        //   // cacheWidth: 37,
                        // ),
                        // Icon(
                        //   Icons.person_outlined,
                        //   size: 60.0.sp,
                        //   color: Colors.black,
                        // ),
                        // backgroundColor: animagiee_CL,
                        radius: 45.0.sp,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      // backgroundImage: ExactAssetImage("images/editicon.png",),
                      radius: 13.0.sp,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        "images/editicon.png",
                        height: 2.0.hp,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  top: 40.0.sp,
                  child: Padding(
                    padding: EdgeInsets.only(top: 70.0.sp, left: 80.0.sp),
                    child: Align(
                      heightFactor: 5,
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        // backgroundImage: ExactAssetImage("images/editicon.png",),
                        radius: 14.0.sp,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          "images/editicon.png",
                          height: 2.0.hp,
                          // 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // Container(
          //   width: 258,
          //   child: TextField(
          //     decoration: new InputDecoration(
          //       // hintText: "Enter your email",
          //       labelText: "Group Name",
          //       labelStyle: GoogleFonts.poppins(
          //         textStyle: TextStyle(
          //           color: const Color.fromRGBO(170, 171, 171, 1),
          //           fontSize: 9.0.sp,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 3.0.hp,
          ),
          Container(
            child: Text(
              "Chennai Dogs FC",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 10.0.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Divider(
            color: animagiee_CL,
            endIndent: 130,
            indent: 130,
            thickness: 2,
          ),
          SizedBox(
            height: 3.0.hp,
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0.sp),
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
                    child: SizedBox(
                        width: 90.0.wp,
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
                    child: SizedBox(
                        width: 90.0.wp,
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
                    margin: EdgeInsets.only(left: 10.0.sp),
                    width: 87.5.wp,
                    // 320,
                    height: 5.0.hp,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValue,
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
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['One', 'Two', 'Free', 'Four']
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
                          // cacheHeight: 13,
                          // cacheWidth: 13,
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0.sp),
                    width: 87.0.wp, height: 5.0.hp,
                    // width: 320,
                    // height: 40,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValue,
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
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['One', 'Two', 'Free', 'Four']
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
          SizedBox(height: 3.0.hp
              //  40,
              ),
          GestureDetector(
            onTap: () {
              // Get.to(Animals_Profiles_UI());
              Get.to(MyClubs_UI());
            },
            child: Container(
              height: 6.0.hp,
              //  43,
              width: 90.0.wp,
              // 310,
              decoration: BoxDecoration(
                  color: Color(0xff272727),
                  borderRadius: BorderRadius.circular(12.0.sp)),
              alignment: Alignment.center,
              child: Text(
                "Create",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 15.0.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
