import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/instancepage/controller/userprofie_viewController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';

class User_Profile_Discription_UI extends StatefulWidget {
  const User_Profile_Discription_UI({Key? key}) : super(key: key);

  @override
  State<User_Profile_Discription_UI> createState() =>
      _User_Profile_Discription_UIState();
}

class _User_Profile_Discription_UIState
    extends State<User_Profile_Discription_UI> {
  UserPostProfileController userPostProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => userPostProfileController.data.isEmpty
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.grey,
              strokeWidth: 2,
            ))
          : ListView.builder(
              shrinkWrap: true,

              //  scrollDirection: Axis.vertical,
              itemCount: userPostProfileController.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(left: 15.0.sp),
                  child: Text(
                    userPostProfileController.data[index].about.toString(),
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 9.0.sp,
                        color: dummycontent_Cl,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
