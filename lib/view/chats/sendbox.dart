import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';

class Send_Box_UI extends StatefulWidget {
  const Send_Box_UI({Key? key}) : super(key: key);

  @override
  State<Send_Box_UI> createState() => _Send_Box_UIState();
}

class _Send_Box_UIState extends State<Send_Box_UI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.8.hp,
      //  35,
      width: 95.0.wp,
      //  341,
      decoration: BoxDecoration(
          color: Color.fromRGBO(237, 237, 237, 1),
          borderRadius: BorderRadius.circular(20.0.sp)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.camera_alt,
                color: sendBox_CL,
              )),
          Container(
            width: 48.0.wp,
            // 195,
            height: 2.8.hp,
            //  40,
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type your message",
                  hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 8.0.sp,
                      color: sendBox_CL,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  isCollapsed: false
                  // label: Text("Type your message"),
                  // // labelText: ,
                  // labelStyle: GoogleFonts.poppins(
                  //   textStyle: TextStyle(
                  //     fontSize: 8.0.sp,
                  //     color: sendBox_CL,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ),
                  ),
            ),
          ),
          SizedBox(
            width: 4.0.wp,
          ),
          Visibility(
            visible: false,
            child: Text(
              "Send",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 10.0.sp,
                  color: send_button_CL,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: Row(
              children: [
                Transform.rotate(
                  angle: 5.5,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.attachment_outlined,
                        size: 17.0.sp,
                        color: sendBox_CL,
                      )),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.emoji_emotions,
                      size: 17.0.sp,
                      color: sendBox_CL,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
