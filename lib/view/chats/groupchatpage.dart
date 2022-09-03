import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/chats/sendbox.dart';
import 'package:animagieeui/view/chats/singlechatoption.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';
import 'groupchatoption.dart';

class GroupMulti_Chat_Page_UI extends StatefulWidget {
  const GroupMulti_Chat_Page_UI({Key? key}) : super(key: key);

  @override
  State<GroupMulti_Chat_Page_UI> createState() =>
      _GroupMulti_Chat_Page_UIState();
}

class _GroupMulti_Chat_Page_UIState extends State<GroupMulti_Chat_Page_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 80,
      child: Stack(children: [
        Container(
          child: Column(
            children: [
              // controller.chatscreenapp("Karthi", context),
              Expanded(
                  child: ListView.builder(
                shrinkWrap: true,
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
                                      // height: 31,
                                      // width: 159,
                                      height: 4.0.hp,
                                      //  31,
                                      width: 43.0.wp,
                                      // 159,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(238, 238, 238, 1),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20))),
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
                            height: 6.5.hp,
                            // 60,
                            width: 45.0.wp,

                            // height: 31,
                            // width: 159,
                            // color: Colors.black,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    // CircleAvatar(),
                                    Container(
                                      height: 4.0.hp,
                                      //  31,
                                      width: 43.0.wp,
                                      // 159,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(238, 238, 238, 1),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20))),
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
              SizedBox(
                height: 2.0.hp,
              ),
            ],
          ),
        ),
        Group_Chat_Option_UI(),
        // Single_Chat_Options_UI(),
      ]),
    );
  }
}
