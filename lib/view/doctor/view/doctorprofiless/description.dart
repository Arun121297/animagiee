import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../../config/colorconfig.dart';

class Doctor_Description_UI extends StatefulWidget {
  const Doctor_Description_UI({Key? key}) : super(key: key);

  @override
  State<Doctor_Description_UI> createState() => _Doctor_Description_UIState();
}

class _Doctor_Description_UIState extends State<Doctor_Description_UI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 16.0.sp),
      child: Text(
        "Lorem Ipsum is simply dummy text of the printing and\n"
        "typesetting industry. Lorem Ipsum has been the industry's\n"
        "standard dummy text ever since the 1500s, when an\n"
        "unknown printer took",
        maxLines: 4,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 9.0.sp,
            color: text_2,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
