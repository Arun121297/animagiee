import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/homepage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';

import 'appoinments.dart';
import 'appoinmentwork.dart';
import 'doctorsappoinments.dart';
import 'mystatus.dart';
import 'myworkheader.dart';

class My_Work_Design_UI extends StatefulWidget {
  const My_Work_Design_UI({Key? key}) : super(key: key);

  @override
  State<My_Work_Design_UI> createState() => _My_Work_Design_UIState();
}

class _My_Work_Design_UIState extends State<My_Work_Design_UI> {
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  List days = [
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ];
  List<bool> values = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  String dropdownValue = 'One';
  bool toshift = false;
  bool fromshift = false;
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.chatapp("My Work", Home_Page(), context),
              // Material(
              //   elevation: 3,
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     child: Row(children: [
              //       Back_Button_UI(),
              //       Expanded(child: SizedBox()),
              //       Padding(
              //         padding: const EdgeInsets.only(left: 30.0),
              //         child: Text("My Work"),
              //       ),
              //       Expanded(child: Container()),
              //       Expanded(child: Container()),
              //       // Search_UI(),
              //       // Notification_UI(),
              //     ]),
              //   ),
              // ),
              MyWork_Header_UI(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Lorem ipsum dolor sit amet, consectetur."),
              ),
              List_Of_Appoinment_UI(),
              Expanded(
                  child: SingleChildScrollView(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Appointments"),
                      ),
                      Appoinments_Design_UI(),
                      GestureDetector(
                        onTap: () {
                          Get.to(Appoinment_Page_UI());
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          alignment: Alignment.topRight,
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "View All",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 8.5.sp,
                                color: animagiee_CL,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "My status",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 8.5.sp,
                              color: myworktext_1_CL,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      MyStatus_UI(),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Available Time",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 8.5.sp,
                              color: myworktext_1_CL,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "From",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 8.5.sp,
                                    color: WelcomeContent_Cl,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 45.0.wp,
                                //  150,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: animagiee_CL,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5))),
                                      height: 4.0.hp,
                                      // 30,
                                      width: 24.0.wp,
                                      // 82,
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: dropdownValue,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        elevation: 16,
                                        style: const TextStyle(
                                            color: Color.fromRGBO(
                                                176, 176, 176, 1)),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.transparent,
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'One',
                                          'Two',
                                          'Free',
                                          'Four'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                value,
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontSize: 8.5.sp,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (fromshift == false) {
                                            fromshift = true;
                                          } else {
                                            fromshift = false;
                                          }
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: myworkaniopacity,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(5),
                                                bottomRight:
                                                    Radius.circular(5))),
                                        alignment: Alignment.center,
                                        height: 4.0.hp,
                                        //  30,
                                        width: 16.0.wp,
                                        // 68,
                                        child: Text(
                                          fromshift == false ? "PM" : "AM",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 8.5.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "To",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 8.5.sp,
                                    color: WelcomeContent_Cl,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 45.0.wp,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: animagiee_CL,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5))),
                                      height: 4.0.hp,
                                      // 30,
                                      width: 24.0.wp,
                                      // 82,
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: dropdownValue,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        elevation: 16,
                                        style: const TextStyle(
                                            color: Color.fromRGBO(
                                                176, 176, 176, 1)),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.transparent,
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'One',
                                          'Two',
                                          'Free',
                                          'Four'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                value,
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontSize: 8.5.sp,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (toshift == false) {
                                            toshift = true;
                                          } else {
                                            toshift = false;
                                          }
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        // height: 30,
                                        decoration: BoxDecoration(
                                            color: myworkaniopacity,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(5),
                                                bottomRight:
                                                    Radius.circular(5))),
                                        height: 4.0.hp,
                                        //  30,
                                        width: 16.0.wp,
                                        // 68,
                                        child: Text(
                                          toshift == true ? "PM" : "AM",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 8.5.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Available days",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 8.5.sp,
                              color: myworktext_1_CL,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Card(
                          child: Container(
                        height: 16.0.hp,
                        //  100,
                        width: 95.0.wp,
                        // 336,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.4,
                            crossAxisCount: 4,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                          ),
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Row(
                                children: [
                                  Checkbox(
                                    fillColor: MaterialStateProperty
                                        .resolveWith<Color>((states) {
                                      if (states
                                          .contains(MaterialState.disabled)) {
                                        return animagiee_CL.withOpacity(.32);
                                      }
                                      return animagiee_CL;
                                    }),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    value: values[index],
                                    activeColor: animagiee_CL,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        values[index] = value!;
                                      });
                                    },
                                  ),
                                  Text("${days[index]}")
                                ],
                              ),
                            );
                          },
                        ),
                      )),
                      SizedBox(height: 3.0.hp
                          // 15,
                          ),
                      Align(
                        alignment: Alignment.center,
                        child: controller.communityNext("Upload", null),
                      ),
                      // GestureDetector(
                      //     onTap: () {
                      //       Get.to(Appoinment_Page_UI());
                      //     },
                      //     child: Container(
                      //       height: 6.0.hp,
                      //       //  43,
                      //       width: 90.0.wp,
                      //       //  310,
                      //       decoration: BoxDecoration(
                      //           color: buttonColor1_CL,
                      //           borderRadius: BorderRadius.circular(15)),
                      //       alignment: Alignment.center,
                      //       child: Text(
                      //         "Upload",
                      //         style: GoogleFonts.poppins(
                      //           textStyle: TextStyle(
                      //             fontSize: 15.5.sp,
                      //             color: SigninButton_CL,
                      //             fontWeight: FontWeight.w600,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 3.0.hp,
                        // 15,
                      ),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
