import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../chats/chat.dart';

class Message_Button_UI extends StatefulWidget {
  const Message_Button_UI({Key? key}) : super(key: key);

  @override
  State<Message_Button_UI> createState() => _Message_Button_UIState();
}

class _Message_Button_UIState extends State<Message_Button_UI> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 47.0.sp, right: 10),
      child: Align(
        alignment: Alignment.bottomRight,
        heightFactor: 5,
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Text("1,22 Member"),
              GestureDetector(
                onTap: () {
                  // print(controller.communitylist.length);
                  Get.to(Chatting_Screen_UI());
                },
                child: Container(
                  height: 3.0.hp,
                  // 26,
                  width: 25.0.wp,
                  // 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: animagiee_CL,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    "Message",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 9.0.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
