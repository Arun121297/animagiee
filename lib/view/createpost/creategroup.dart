import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Create_Post_UI extends StatefulWidget {
  const Create_Post_UI({Key? key}) : super(key: key);

  @override
  State<Create_Post_UI> createState() => _Create_Post_UIState();
}

class _Create_Post_UIState extends State<Create_Post_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: controller.posttype_bool.value,
      child: Align(
        alignment: Alignment.center,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0.sp)),
          elevation: 3,
          child: Stack(children: [
            Container(
              height: 8.0.hp,
              //  60,
              width: 94.0.wp,
              //  339,
              // color: Colors.green,
              child: Row(children: [
                Container(
                  height: 6.0.hp, //  45,
                  width: 12.0.wp,
                  // 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.sp),
                    image: DecorationImage(
                      image: AssetImage("images/profilephotos.jpg"),
                    ),
                  ),
                ),
                Text(
                  "Arun's Group",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 9.0.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Icon(Icons.keyboard_arrow_down),
                SizedBox(
                  width: 12,
                )
              ]),
            ),
            Obx(() {
              return Visibility(
                visible: controller.posttype_bool.value,
                child: Container(
                  height: 8.0.hp,
                  //  60,
                  width: 94.0.wp,
                  //  339,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0.sp),
                    color: Colors.black54,
                  ),
                ),
              );
            })
          ]),
        ),
      ),
    );
  }
}
