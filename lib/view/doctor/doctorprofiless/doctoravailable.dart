import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Available_Time_UI extends StatefulWidget {
  const Available_Time_UI({Key? key}) : super(key: key);

  @override
  State<Available_Time_UI> createState() => _Available_Time_UIState();
}

class _Available_Time_UIState extends State<Available_Time_UI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 16),
      child: Text(
        "Available time From 6.00 PM to 8.00PM",
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            letterSpacing: -0.09,
            fontSize: 11.0.sp,
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
