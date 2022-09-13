import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWork_Header_UI extends StatefulWidget {
  const MyWork_Header_UI({Key? key}) : super(key: key);

  @override
  State<MyWork_Header_UI> createState() => _MyWork_Header_UIState();
}

class _MyWork_Header_UIState extends State<MyWork_Header_UI> {
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
                  image: AssetImage("images/doc_3.jpg"), fit: BoxFit.cover),
              // color: animagiee_CL,
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
              // image: DecorationImage(
              //     image: AssetImage("images/doc_3.jpg"),
              //     fit: BoxFit.cover),
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
          padding: EdgeInsets.only(top: 40.0, left: 20),
          child: Align(
            heightFactor: 1.4,
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              radius: 42.0.sp,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage: ExactAssetImage("images/doc_2.jpg"),
                // backgroundColor: animagiee_CL,
                radius: 40.0.sp,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 35.0.sp, bottom: 15.0.sp),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(left: 40.0.sp),
              height: 4.0.hp,
              // 31,
              width: 9.0.wp,
              // 27,
              child: Image.asset("images/badge_1.png"),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(50.0.sp),
          child: Container(
              margin: EdgeInsets.only(left: 60.0.sp),
              child: Text(
                "Meena",
                style: GoogleFonts.jost(
                  textStyle: TextStyle(
                    fontSize: 20.5.sp,
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
