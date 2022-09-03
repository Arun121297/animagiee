import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import 'doctorappoinment2ndpage.dart';

class Appoinment_Page_UI extends StatefulWidget {
  const Appoinment_Page_UI({Key? key}) : super(key: key);

  @override
  State<Appoinment_Page_UI> createState() => _Appoinment_Page_UIState();
}

class _Appoinment_Page_UIState extends State<Appoinment_Page_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              controller.cusapp("Appoinments", context),
              SizedBox(height: 3.0.hp
                  // 15,
                  ),
              ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(Doctors_Appoinment_Detaild_UI());
                    },
                    child: Card(
                        child: SizedBox(
                      height: 13.0.hp,
                      //  83,
                      width: 90.0.wp,
                      // 246,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 11.0.hp,
                            //  69,
                            width: 30.0.wp,
                            // 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage("images/doc_4.jpg"))),
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
                                        fontSize: 10.0.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15.0.wp
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
                                        color: index == 2
                                            ? Colors.green
                                            : animagiee_CL),
                                    child: Text(
                                      index == 2 ? "Completed" : "View",
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
                                    fontSize: 9.5.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                "Appointment Date 12/04/2022",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 9.5.sp,
                                    color: myworkaniopacity,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                "Appointment at 6.30 PM",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 9.5.sp,
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
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
