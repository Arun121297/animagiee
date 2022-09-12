import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/chats/chatscreen1.dart';
import 'package:animagieeui/view/chats/sendbox.dart';
import 'package:animagieeui/view/chats/singlechatoption.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';

// import 'chatappbar.dart';

class Chatting_Screen_UI extends StatefulWidget {
  const Chatting_Screen_UI({Key? key}) : super(key: key);

  @override
  State<Chatting_Screen_UI> createState() => _Chatting_Screen_UIState();
}

class _Chatting_Screen_UIState extends State<Chatting_Screen_UI> {
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            child: Column(
              children: [
                // Material(
                //   elevation: 3,
                //   child: Container(
                //     width: MediaQuery.of(context).size.width,
                //     child: Row(children: [
                //       // Back_Button_UI(),
                //       Chat_Screen_Back_Button(),
                //       Expanded(child: Container()),
                //       // Expanded(child: SizedBox()),

                //       Row(
                //         children: [
                //           CircleAvatar(
                //             radius: 16,
                //             backgroundColor: animagiee_CL,
                //             child: CircleAvatar(radius: 15),
                //           ),
                //           SizedBox(
                //             width: 10,
                //           ),
                //           Text("Karthi"),
                //         ],
                //       ),
                //       Expanded(child: Container()),
                //       IconButton(
                //           onPressed: () {
                //             if (controller.chatoption.value == false) {
                //               controller.chatoption.value = true;
                //             } else {
                //               controller.chatoption.value = false;
                //             }
                //           },
                //           icon: Icon(Icons.menu))
                //     ]),
                //   ),
                // ),
                controller.chatscreenapp("Karthi", Chat_UI(), context),
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
                            padding: EdgeInsets.all(8.0.sp),
                            child: Container(
                              height: 7.5.hp,
                              // 60,
                              width: 56.5.wp,
                              //  199,
                              // color: Colors.black,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(),
                                      SizedBox(
                                        width: 5,
                                      ),
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
                                                    Radius.circular(20.0.sp))),
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
                        SizedBox(height: 3.0.hp
                            // 16,
                            ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.all(8.0.sp),
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
                                                    Radius.circular(20.0.sp))),
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
          Single_Chat_Options_UI(),
        ]),
      ),
    );
  }
}
