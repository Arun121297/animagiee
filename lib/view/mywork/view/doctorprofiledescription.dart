import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';

class Doctor_Description_Profile_UI extends StatefulWidget {
  const Doctor_Description_Profile_UI({Key? key}) : super(key: key);

  @override
  State<Doctor_Description_Profile_UI> createState() =>
      _Doctor_Description_Profile_UIState();
}

class _Doctor_Description_Profile_UIState
    extends State<Doctor_Description_Profile_UI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 10),
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur.",
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 10.0.sp,
            color: dummycontent_Cl,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
