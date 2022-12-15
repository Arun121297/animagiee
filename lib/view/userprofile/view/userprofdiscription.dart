import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';

class User_Profile_Discription_UI extends StatefulWidget {
  const User_Profile_Discription_UI({Key? key}) : super(key: key);

  @override
  State<User_Profile_Discription_UI> createState() =>
      _User_Profile_Discription_UIState();
}

class _User_Profile_Discription_UIState
    extends State<User_Profile_Discription_UI> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur.",
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 9.0.sp,
            color: dummycontent_Cl,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
