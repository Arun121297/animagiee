import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';

class Doctor_Available_Time_UI_Content extends StatefulWidget {
  const Doctor_Available_Time_UI_Content({Key? key}) : super(key: key);

  @override
  State<Doctor_Available_Time_UI_Content> createState() =>
      _Doctor_Available_Time_UI_ContentState();
}

class _Doctor_Available_Time_UI_ContentState
    extends State<Doctor_Available_Time_UI_Content> {
  String fromdropdownValue = '6.00';
  String todropdownValue = "7.00";
  bool toshift = false;
  bool fromshift = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "From",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 10.5.sp,
                  color: availabletime_CL,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: 45.0.wp,
              //  150,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: animagiee_CL,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5))),
                    height: 4.0.hp,
                    // 30,
                    width: 24.0.wp,
                    // 82,
                    child: DropdownButton<String>(
                      dropdownColor: Colors.grey.shade300,
                      isExpanded: true,
                      value: fromdropdownValue,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      elevation: 16,
                      style: const TextStyle(
                          color: Color.fromRGBO(176, 176, 176, 1)),
                      underline: Container(
                        height: 2,
                        color: Colors.transparent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          fromdropdownValue = newValue!;
                        });
                      },
                      items: <String>['6.00', '6.30', '7.30', '8.00']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              value,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 8.5.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (fromshift == false) {
                          fromshift = true;
                        } else {
                          fromshift = false;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: myworkaniopacity,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      alignment: Alignment.center,
                      height: 4.0.hp,
                      //  30,
                      width: 16.0.wp,
                      // 68,
                      child: Text(
                        fromshift == false ? "PM" : "AM",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 8.5.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "To",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 10.5.sp,
                  color: availabletime_CL,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: 45.0.wp,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: animagiee_CL,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5))),
                    height: 4.0.hp,
                    // 30,
                    width: 24.0.wp,
                    // 82,
                    child: DropdownButton<String>(
                      dropdownColor: Colors.grey.shade300,
                      isExpanded: true,
                      value: todropdownValue,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      elevation: 16,
                      style: const TextStyle(color: dorpdownbox_CL),
                      underline: Container(
                        height: 2,
                        color: Colors.transparent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          todropdownValue = newValue!;
                        });
                      },
                      items: <String>['7.00', '7.30', '8.00', '8.30']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              value,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 8.5.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (toshift == false) {
                          toshift = true;
                        } else {
                          toshift = false;
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      // height: 30,
                      decoration: BoxDecoration(
                          color: myworkaniopacity,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      height: 4.0.hp,
                      //  30,
                      width: 16.0.wp,
                      // 68,
                      child: Text(
                        toshift == true ? "PM" : "AM",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 8.5.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
