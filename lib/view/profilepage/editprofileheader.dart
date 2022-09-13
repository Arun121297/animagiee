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
      height: 22.0.hp,
      //  168,
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/myprofilebg.jpg"),
                  fit: BoxFit.cover),
              color: animagiee_CL,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0.sp),
                  bottomRight: Radius.circular(15.0.sp))),
          width: MediaQuery.of(context).size.width,
          height: 13.0.hp,
          // 108,
          // child: Image.asset("images/Dogs.jpg", fit: BoxFit.cover),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0.sp),
                  bottomRight: Radius.circular(15.0.sp))),
          width: MediaQuery.of(context).size.width,
          height: 13.0.hp,
          // 108,
          // child: Image.asset("images/Dogs.jpg", fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topRight,
            child: SizedBox(
                height: 6.0.hp,
                width: 9.0.wp,
                child: Image.asset("images/edit.png")),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(48.0.sp),
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.only(
                    left: 40,
                  ),
                  margin: EdgeInsets.only(left: 30.0.sp),
                  child: Text(
                    "MY Profile",
                    style: GoogleFonts.jost(
                      textStyle: TextStyle(
                        fontSize: 19.5.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
              SizedBox(
                width: 3.0.wp,
              ),
              SizedBox(
                  height: 6.0.hp,
                  width: 9.0.wp,
                  child: Image.asset("images/edit.png")),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30.0.sp, left: 15.0.sp),
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
          padding: EdgeInsets.only(right: 80.0.sp),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(right: 35.0.sp, bottom: 10.0.sp),
              child: SizedBox(
                  height: 6.0.hp,
                  width: 9.0.wp,
                  child: Image.asset("images/edit.png")),
            ),
          ),
        ),
      ]),
    );
  }
}
