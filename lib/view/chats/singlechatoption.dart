import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';

class Single_Chat_Options_UI extends StatefulWidget {
  const Single_Chat_Options_UI({Key? key}) : super(key: key);

  @override
  State<Single_Chat_Options_UI> createState() => _Single_Chat_Options_UIState();
}

class _Single_Chat_Options_UIState extends State<Single_Chat_Options_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: controller.chatoption.value,
        child: Padding(
          padding: EdgeInsets.all(33.0.sp),
          child: Align(
            alignment: Alignment.topRight,
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.sp)),
              child: Container(
                height: 15.0.hp,
                // 108,
                width: 30.0.wp,
                // 113,
                margin: EdgeInsets.only(left: 10.0.sp),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0.sp)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Block",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 8.0.sp,
                          color: buttonColor1_CL,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Divider(
                      endIndent: 8,
                      // indent: 5,
                    ),
                    Text(
                      "Mute Notification",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 8.0.sp,
                          color: buttonColor1_CL,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Divider(
                      endIndent: 8,
                      // indent: 10,
                    ),
                    Text(
                      "Clear Chat",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 8.0.sp,
                          color: buttonColor1_CL,
                          fontWeight: FontWeight.w500,
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
    });
  }
}
