import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/bottombarfile/bottomnavibar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/controller.dart';
import '../../animagieeprofile/animalsprofiles.dart';

class Create_New_Club_UI extends StatefulWidget {
  const Create_New_Club_UI({Key? key}) : super(key: key);

  @override
  State<Create_New_Club_UI> createState() => _Create_New_Club_UIState();
}

class _Create_New_Club_UIState extends State<Create_New_Club_UI> {
  Controller controller = Get.put(Controller());
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // bottomNavigationBar: Customized_Bottom_Bar(),
      body: SafeArea(
        child: Column(children: [
          // controller.cappbar("Create New Club"),
          controller.cusapp("Create New Club", context),
          SizedBox(
            height: 20.0.hp,
            // 150,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: animagiee_CL,
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
                        child: Icon(
                          Icons.person_outline,
                          size: 60.0.sp,
                          color: Colors.black,
                        ),
                        backgroundColor: animagiee_CL,
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
                  top: 40.0,
                  child: Padding(
                    padding: EdgeInsets.only(top: 70.0, left: 80),
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
          Container(
            width: 258,
            child: TextField(
              decoration: new InputDecoration(
                // hintText: "Enter your email",
                labelText: "Group Name",
                labelStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(170, 171, 171, 1),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Club Name"),
                ),
                Card(
                    elevation: 3,
                    child: SizedBox(
                        width: 90.0.wp, height: 5.0.hp, child: TextField())),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Club Description"),
                ),
                Card(
                    elevation: 3,
                    child: SizedBox(
                        width: 90.0.wp, height: 5.0.hp, child: TextField())),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Community"),
                ),

                ///dropdown
                Card(
                  elevation: 3,
                  child: SizedBox(
                    width: 90.0.wp,
                    // 320,
                    height: 5.0.hp,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
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
                  child: Text("Community Type"),
                ),
                Card(
                  elevation: 3,
                  child: SizedBox(
                    width: 90.0.wp, height: 5.0.hp,
                    // width: 320,
                    // height: 40,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
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
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              Get.to(Animals_Profiles_UI());
            },
            child: Container(
              height: 6.0.hp,
              //  43,
              width: 90.0.wp,
              // 310,
              decoration: BoxDecoration(
                  color: Color(0xff272727),
                  borderRadius: BorderRadius.circular(12)),
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
