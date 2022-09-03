import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/mywork/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';
import '../chats/sendbox.dart';
import '../chats/singlechatoption.dart';
import '../homeAppBar/backbutton.dart';

class MyWork_Chat_UI extends StatefulWidget {
  const MyWork_Chat_UI({Key? key}) : super(key: key);

  @override
  State<MyWork_Chat_UI> createState() => _MyWork_Chat_UIState();
}

class _MyWork_Chat_UIState extends State<MyWork_Chat_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            child: Column(
              children: [
                myworkchatscreenapp("Karthi", context),
                Expanded(
                    child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => SizedBox(
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.green,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 7.5.hp,
                              // 60,
                              width: 54.5.wp,
                              //  199,
                              // color: Colors.black,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(),
                                      Container(
                                        height: 4.0.hp,
                                        //  31,
                                        width: 43.0.wp,
                                        // 159,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                238, 238, 238, 1),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(20))),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "9.20am",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 7.0.sp,
                                        color: content1_CL,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 7.5.hp,
                              // 60,
                              width: 45.0.wp,

                              // height: 60,
                              // width: 159,
                              // color: Colors.black,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      // CircleAvatar(),
                                      Container(
                                        height: 4.5.hp,
                                        // 60,
                                        width: 45.0.wp,
                                        //  199,
                                        // height: 31,
                                        // width: 159,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                238, 238, 238, 1),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(20))),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "9.20am",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 7.0.sp,
                                        color: content1_CL,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: index == 3 ? true : false,
                          child: Row(children: [
                            Expanded(child: Divider()),
                            Text(
                              "Today",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 10.0.sp,
                                  color: sendBox_CL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(child: Divider()),
                          ]),
                        )
                      ],
                    ),
                  ),
                )),
                Send_Box_UI(),
                SizedBox(height: 2.0.hp
                    //  38,
                    ),
              ],
            ),
          ),

          Obx(() {
            return Visibility(
              visible: controller.chatoption.value,
              child: Padding(
                padding: const EdgeInsets.all(33.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      height: 15.0.hp,
                      // 108,
                      width: 30.0.wp,
                      // 113,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Text(
                              "Block",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 8.0.sp,
                                  color: buttonColor1_CL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            endIndent: 10,
                            indent: 10,
                          ),
                          Container(
                            child: Text(
                              "Mute Notification",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 8.0.sp,
                                  color: buttonColor1_CL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            endIndent: 10,
                            indent: 10,
                          ),
                          Container(
                            child: Text(
                              "Complete Chat",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 8.0.sp,
                                  color: buttonColor1_CL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          })
          // Single_Chat_Options_UI(),
        ]),
      ),
    );
  }

  myworkchatscreenapp(title, context) {
    return Material(
      elevation: 3,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          Back_Button_UI(),
          Expanded(child: Container()),
          Expanded(child: SizedBox()),

          Row(
            children: [
              CircleAvatar(
                radius: 13.0.sp,
                backgroundColor: animagiee_CL,
                child: CircleAvatar(radius: 12.0.sp),
              ),
              SizedBox(
                width: 10,
              ),
              Text(title),
            ],
          ),
          Expanded(child: Container()),
          OtpTimer(),
          // Expanded(child: Container()),
          IconButton(
              onPressed: () {
                if (controller.chatoption.value == false) {
                  controller.chatoption.value = true;
                } else {
                  controller.chatoption.value = false;
                }
              },
              icon: Icon(Icons.menu))
        ]),
      ),
    );
  }
}
