import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';

class Doctor_Details_UI extends StatefulWidget {
  var fetchindex;
  Doctor_Details_UI({Key? key, this.fetchindex}) : super(key: key);

  @override
  State<Doctor_Details_UI> createState() => _Doctor_Details_UIState();
}

class _Doctor_Details_UIState extends State<Doctor_Details_UI> {
  List Doctors_name = [
    "Dr.Meena",
    "Dr.Karthi",
    "Dr.Vishak",
    "Dr.Praba",
    "Dr.Praveen",
    "Dr.Meena",
    "Dr.Karthi",
    "Dr.Vishak",
    "Dr.Praba",
    "Dr.Praveen",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      width: 40.0.wp,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Doctors_name[widget.fetchindex]),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and ...",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 7.0.sp,
                color: dummycontent_Cl,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Row(
            children: [
              Stack(alignment: Alignment.center, children: [
                Icon(
                  Icons.star,
                  color: animagiee_CL,
                  size: 15.0.sp,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 12..sp,
                ),
              ]),
              Stack(alignment: Alignment.center, children: [
                Icon(
                  Icons.star,
                  color: animagiee_CL,
                  size: 15.0.sp,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 12..sp,
                ),
              ]),
              Stack(alignment: Alignment.center, children: [
                Icon(
                  Icons.star,
                  color: animagiee_CL,
                  size: 15.0.sp,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 12..sp,
                ),
              ]),
              Stack(alignment: Alignment.center, children: [
                Icon(
                  Icons.star,
                  color: animagiee_CL,
                  size: 15.0.sp,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 12..sp,
                ),
              ]),
              Stack(alignment: Alignment.center, children: [
                Icon(
                  Icons.star,
                  color: animagiee_CL,
                  size: 15.0.sp,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 12..sp,
                ),
              ]),
            ],
          ),
          RichText(
            text: TextSpan(
              text: '₹ 300 - ',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 9.0.sp,
                  color: doctor_Text_CL,
                  fontWeight: FontWeight.w700,
                ),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' 15 mins',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 9.0.sp,
                      color: doctor_Text_CL,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
