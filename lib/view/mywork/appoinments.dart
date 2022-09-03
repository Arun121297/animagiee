import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Appoinments_Design_UI extends StatefulWidget {
  const Appoinments_Design_UI({Key? key}) : super(key: key);

  @override
  State<Appoinments_Design_UI> createState() => _Appoinments_Design_UIState();
}

class _Appoinments_Design_UIState extends State<Appoinments_Design_UI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(243, 243, 243, 1),
      height: 11.0.hp,
      //  83,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Card(
            child: Container(
          height: 11.0.hp, //  83,
          width: 70.0.wp,
          //  246,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "David joseph",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 6.5.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 14.0.wp
                          // 50,
                          ),
                      Container(
                        height: 23,
                        width: 68,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: animagiee_CL),
                        child: Text(
                          "View",
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
                        fontSize: 7.5.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    "Appointment Date 12/04/2022",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 6.5.sp,
                        color: myworkaniopacity,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    "Appointment at 6.30 PM",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 6.5.sp,
                        color: myworkaniopacity,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
