import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class User_Profile_Image_UI extends StatefulWidget {
  const User_Profile_Image_UI({Key? key}) : super(key: key);

  @override
  State<User_Profile_Image_UI> createState() => _User_Profile_Image_UIState();
}

class _User_Profile_Image_UIState extends State<User_Profile_Image_UI> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 35.0.sp, left: 20.0.sp),
      child: Align(
        heightFactor: 1.4,
        alignment: Alignment.centerLeft,
        child: CircleAvatar(
          radius: 42.0.sp,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            backgroundImage: ExactAssetImage("images/profilephotos.jpg"),
            // backgroundColor: animagiee_CL,
            radius: 40.0.sp,
          ),
        ),
      ),
    );
  }
}
