import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';

class Edit_Profile_Header_UI extends StatefulWidget {
  const Edit_Profile_Header_UI({Key? key}) : super(key: key);

  @override
  State<Edit_Profile_Header_UI> createState() => _Edit_Profile_Header_UIState();
}

class _Edit_Profile_Header_UIState extends State<Edit_Profile_Header_UI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      height: 17.0.hp,
      //  168,
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/myprofilebg.jpg"),
                  fit: BoxFit.cover),
              color: animagiee_CL,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          width: MediaQuery.of(context).size.width,
          height: 10.0.hp,
          // 108,
          // child: Image.asset("images/Dogs.jpg", fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              child: Image.asset(
                "images/editicon.png",
                cacheHeight: 14,
                cacheWidth: 14,
              ),
              radius: 13.0.sp,
              backgroundColor: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 89.0),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 76.0, bottom: 15),
              child: CircleAvatar(
                child: Image.asset(
                  "images/editicon.png",
                  cacheHeight: 14,
                  cacheWidth: 14,
                ),
                radius: 12.0.sp,
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 20),
          child: Align(
            heightFactor: 1.4,
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              radius: 42.0.sp,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage: ExactAssetImage("images/myprofile.jpg"),
                // backgroundColor: animagiee_CL,
                radius: 40.0.sp,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 80.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(right: 40.0, bottom: 20),
              child: CircleAvatar(
                child: Image.asset(
                  "images/editicon.png",
                  cacheHeight: 14,
                  cacheWidth: 14,
                ),
                radius: 12.0.sp,
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
              padding: EdgeInsets.only(left: 40),
              margin: EdgeInsets.only(left: 53),
              child: Text(
                "MY Profile",
                style: GoogleFonts.jost(
                  textStyle: TextStyle(
                    fontSize: 21.0.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),
        ),
      ]),
    );
  }
}
