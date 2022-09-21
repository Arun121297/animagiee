import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';

class Doctor_Available_Days_UI extends StatefulWidget {
  var fetchindex;
  Doctor_Available_Days_UI({Key? key, this.fetchindex}) : super(key: key);

  @override
  State<Doctor_Available_Days_UI> createState() =>
      _Doctor_Available_Days_UIState();
}

class _Doctor_Available_Days_UIState extends State<Doctor_Available_Days_UI> {
  bool values = false;
  List days = [
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.disabled)) {
                return animagiee_CL.withOpacity(.32);
              }
              return animagiee_CL;
            }),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            value: values,
            activeColor: animagiee_CL,
            onChanged: (bool? value) {
              setState(() {
                values = value!;
              });
            },
          ),
          Text(
            "${days[widget.fetchindex]}",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 10.5.sp,
                color: Color.fromRGBO(102, 102, 102, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
