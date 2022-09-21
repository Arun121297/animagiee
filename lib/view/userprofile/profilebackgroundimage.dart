import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../config/colorconfig.dart';

class Profile_BG_Image_UI extends StatefulWidget {
  const Profile_BG_Image_UI({Key? key}) : super(key: key);

  @override
  State<Profile_BG_Image_UI> createState() => _Profile_BG_Image_UIState();
}

class _Profile_BG_Image_UIState extends State<Profile_BG_Image_UI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: animagiee_CL,
          image: DecorationImage(
              image: AssetImage(
                "images/groupphoto.jpg",
              ),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0.sp),
              bottomRight: Radius.circular(15.0.sp))),
      width: MediaQuery.of(context).size.width,
      height: 13.0.hp,
      // 108,
      // child: Image.asset("images/groupphoto.jpg", fit: BoxFit.cover),
    );
  }
}
