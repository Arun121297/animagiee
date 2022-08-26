import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';

class Doctor_Details_UI extends StatefulWidget {
  var fetchindex;
  Doctor_Details_UI({Key? key, this.fetchindex}) : super(key: key);

  @override
  State<Doctor_Details_UI> createState() => _Doctor_Details_UIState();
}

class _Doctor_Details_UIState extends State<Doctor_Details_UI> {
  // List appoinmenttime = ["₹ 300 - 15 mins", "₹ 15 / min"];
  List Doctors_name = [
    "Dr.Meena",
    "Dr.Karthi",
    "Dr.Vishak",
    "Dr.Praba",
    "Dr.Praveen"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 123,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Doctors_name[widget.fetchindex]),
          Text(
            maxLines: 2,
            "Lorem Ipsum is simply dummy"
            "text of the printing and ...",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 7.0.sp,
                color: dummycontent_Cl,
                fontWeight: FontWeight.w400,
              ),
            ),
            // overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
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
          Text(
            "₹ 300 - 15 mins",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 9.0.sp,
                color: dummycontent_Cl,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
