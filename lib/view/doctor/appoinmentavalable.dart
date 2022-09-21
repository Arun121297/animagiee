import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import 'doctorprofiless/doctorprofile.dart';

class Doctor_Appoinment_UI extends StatefulWidget {
  var fetchindex;
  Doctor_Appoinment_UI({Key? key, this.fetchindex}) : super(key: key);

  @override
  State<Doctor_Appoinment_UI> createState() => _Doctor_Appoinment_UIState();
}

class _Doctor_Appoinment_UIState extends State<Doctor_Appoinment_UI> {
  List available = [
    "Available",
    "Available",
    "Available",
    "Not Available Today",
    "Available",
    "Available",
    "Available",
    "Available",
    "Available",
    "Available",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(Doctor_Profile_UI());
          },
          child: Container(
            height: 6.0.hp,
            //  47,
            width: 24.0.wp,
            // 90,
            alignment: Alignment.center,
            child: Text(
              "Make "
              "appointment ",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 9.0.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: animagiee_CL, borderRadius: BorderRadius.circular(5)),
          ),
        ),
        Text(
          available[widget.fetchindex],
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 7.0.sp,
              color: widget.fetchindex != 3 ? Colors.green : Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
