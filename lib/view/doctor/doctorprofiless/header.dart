import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';

class Profile_Header_UI extends StatefulWidget {
  const Profile_Header_UI({Key? key}) : super(key: key);

  @override
  State<Profile_Header_UI> createState() => _Profile_Header_UIState();
}

class _Profile_Header_UIState extends State<Profile_Header_UI> {
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
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          width: MediaQuery.of(context).size.width,
          height: 14.0.hp,
          // 108,
          // child: Image.asset("images/Dogs.jpg", fit: BoxFit.cover),
        ),
        Container(
          decoration: BoxDecoration(
              // image: DecorationImage(
              //     image: AssetImage("images/doc_3.jpg"),
              //     fit: BoxFit.cover),
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          width: MediaQuery.of(context).size.width,
          height: 14.0.hp,
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
          padding: EdgeInsets.only(left: 50, bottom: 15),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(left: 40),
              height: 31,
              width: 27,
              child: Image.asset("images/badge_1.png"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(70.0),
          child: Container(
              margin: EdgeInsets.only(left: 53),
              child: Text(
                "Dr.Meena",
                style: GoogleFonts.jost(
                  textStyle: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 35, right: 10),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: SizedBox()),
                SizedBox(
                  width: 80,
                ),
                Text("₹ 300 - 15 mins"),
                Expanded(child: SizedBox()),
                // SizedBox(
                //   width: 17,
                // ),
                Stack(alignment: Alignment.center, children: [
                  Icon(
                    Icons.star,
                    color: animagiee_CL,
                    size: 17,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 13,
                  ),
                ]),
                Stack(alignment: Alignment.center, children: [
                  Icon(
                    Icons.star,
                    color: animagiee_CL,
                    size: 17,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 13,
                  ),
                ]),
                Stack(alignment: Alignment.center, children: [
                  Icon(
                    Icons.star,
                    color: animagiee_CL,
                    size: 17,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 13,
                  ),
                ]),
                Stack(alignment: Alignment.center, children: [
                  Icon(
                    Icons.star,
                    color: animagiee_CL,
                    size: 17,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 13,
                  ),
                ]),
                Stack(alignment: Alignment.center, children: [
                  Icon(
                    Icons.star,
                    color: animagiee_CL,
                    size: 17,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 13,
                  ),
                ]),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
