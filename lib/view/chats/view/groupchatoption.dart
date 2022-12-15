import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/colorconfig.dart';
import '../../../../controller/controller.dart';

class Group_Chat_Option_UI extends StatefulWidget {
  const Group_Chat_Option_UI({Key? key}) : super(key: key);

  @override
  State<Group_Chat_Option_UI> createState() => _Group_Chat_Option_UIState();
}

class _Group_Chat_Option_UIState extends State<Group_Chat_Option_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: controller.chatoption.value,
        child: Padding(
          padding: EdgeInsets.all(10.0.sp),
          child: Align(
            alignment: Alignment.topRight,
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.sp)),
              child: Container(
                height: 12.0.hp,
                //  108,
                width: 30.0.wp,
                //  113,
                margin: EdgeInsets.only(left: 10.0.sp),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0.sp)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Container(
                      child: Text(
                        "Edit Group",
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
                      // indent: 10,
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
                    SizedBox(
                      height: 1.0.hp,
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
