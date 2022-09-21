import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import 'doctorappoinment2ndpage.dart';

class Doctor_Details_List_Content extends StatefulWidget {
  var fetchindex;
  Doctor_Details_List_Content({Key? key, this.fetchindex}) : super(key: key);

  @override
  State<Doctor_Details_List_Content> createState() =>
      _Doctor_Details_List_ContentState();
}

class _Doctor_Details_List_ContentState
    extends State<Doctor_Details_List_Content> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(Doctors_Appoinment_Detaild_UI());
      },
      child: Card(
          child: Container(
        //  83,
        width: 70.0.wp,
        // 246,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 9.0.hp,
              // 75,
              width: 13.0.wp,
              //  75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image:
                      DecorationImage(image: AssetImage("images/doc_4.jpg"))),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "David joseph",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 7.5.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: 14.0.wp
                        // 50,
                        ),
                    Container(
                      height: 4.0.hp,
                      // 30,
                      width: 23.0.wp,
                      //  90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: widget.fetchindex == 2
                              ? Colors.green
                              : animagiee_CL),
                      child: Text(
                        widget.fetchindex == 2 ? "Completed" : "View",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 6.5.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Pet type - Dog",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 8.0.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 5.0.hp,
                // ),
                Text(
                  "Appointment Date 12/04/2022",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 7.0.sp,
                      color: myworkaniopacity,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  "Appointment at 6.30 PM",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 7.0.sp,
                      color: myworkaniopacity,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // Expanded(child: SizedBox())
              ],
            )
          ],
        ),
      )),
    );
  }
}
