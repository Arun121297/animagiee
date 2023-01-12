import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/config/text_styles.dart';
import 'package:animagieeui/view/instancepage/controller/userprofie_viewController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class User_Profile_Name_UI extends StatefulWidget {
  @override
  State<User_Profile_Name_UI> createState() => _User_Profile_Name_UIState();
}

class _User_Profile_Name_UIState extends State<User_Profile_Name_UI> {
  UserPostProfileController userPostProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
          shrinkWrap: true,

          //  scrollDirection: Axis.vertical,
          itemCount: userPostProfileController.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(left: 55.0.sp, top: 55.0.sp),
              child: Container(
                  margin: EdgeInsets.only(left: 63.0.sp, top: 6.00.sp),
                  child: Text(
                    userPostProfileController.data[index].username.toString(),
                    style: GoogleFonts.jost(textStyle: profileNmae),
                  )),
            );
          }),
    );
  }
}
