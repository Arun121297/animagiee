import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import 'myworkchat.dart';

class Doctors_Appoinment_Detaild_UI extends StatefulWidget {
  const Doctors_Appoinment_Detaild_UI({Key? key}) : super(key: key);

  @override
  State<Doctors_Appoinment_Detaild_UI> createState() =>
      _Doctors_Appoinment_Detaild_UIState();
}

class _Doctors_Appoinment_Detaild_UIState
    extends State<Doctors_Appoinment_Detaild_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            controller.cusapp("Appoinment Details", context),
            Stack(children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/doc_3.jpg"),
                        fit: BoxFit.cover),
                    // color: animagiee_CL,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                width: MediaQuery.of(context).size.width,
                height: 14.0.hp,
                // 108,
                // child: Image.asset("images/Dogs.jpg", fit: BoxFit.cover),
              ),
              Container(
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    //     image: AssetImage("images/doc_3.jpg"),
                    //     fit: BoxFit.cover),
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                width: MediaQuery.of(context).size.width,
                height: 14.0.hp,
                // 108,
                // child: Image.asset("images/Dogs.jpg", fit: BoxFit.cover),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.0, left: 20),
                child: Align(
                  heightFactor: 1.4,
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    radius: 42.0.sp,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundImage: ExactAssetImage("images/doc_2.jpg"),
                      // backgroundColor: animagiee_CL,
                      radius: 40.0.sp,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(70.0),
                child: Container(
                    margin: EdgeInsets.only(left: 53),
                    child: Text(
                      "James Patric",
                      style: GoogleFonts.jost(
                        textStyle: TextStyle(
                          fontSize: 20.0.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
              ),
            ]),
            Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "images/appoinmentdetails.png",
                      cacheHeight: 20,
                      cacheWidth: 22,
                    ),
                  ),
                  Text(
                    "Appointment details",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 10.0.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40.0.hp, //  434,
              color: doctor_CL,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 38),
                    child: Text(
                      "Appointment details",
                      // textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 10.0.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: animagiee_CL, width: 1)),
                      height: 30.0.hp,
                      // 242,
                      width: 85.0.wp,
                      // 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Date",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 9.0.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  ":  3-march-2022",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 9.0.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Day",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 9.0.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Text(
                                  ":  Tuesday",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 9.0.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 26,
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Time",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 9.0.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Text(
                                  ":  6.00 PM",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 9.0.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 33,
                                ),
                                Expanded(
                                  child: SizedBox(),
                                )
                              ],
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Pet Name",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 9.0.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Text(
                                  ":  Johnney",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 9.0.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 54,
                                ),
                                Expanded(
                                  child: SizedBox(),
                                )
                              ],
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Pet Type",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 9.0.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Text(
                                  ":  Dog",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 9.0.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Expanded(
                                  child: SizedBox(),
                                )
                              ],
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Problem description ",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 9.0.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  ":  Lorem Ipsum is simply\n"
                                  "   dummy text of the printing\n"
                                  "   and typesetting industry.\n"
                                  "   Lorem Ipsum........",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 9.0.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  // maxLines: 4,
                                ),
                                Expanded(
                                  child: SizedBox(),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 67,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                padding: EdgeInsets.all(10),
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 10,
                  );
                },
                itemCount: 6,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    AlertDialog();
                  },
                  child: Container(
                    height: 15.0.hp,
                    //  63,
                    width: 25.0.wp,
                    //  63,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/Cats.jpg"))),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Get.to(MyWork_Chat_UI());
                },
                child: Container(
                  height: 6.0.hp,
                  //  43,
                  width: 90.0.wp,
                  // 310,
                  decoration: BoxDecoration(
                      color: buttonColor1_CL,
                      borderRadius: BorderRadius.circular(15)),
                  alignment: Alignment.center,
                  child: Text(
                    "Start chat",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: SigninButton_CL,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  AlertDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 23.0.hp, width: 70.0.wp,
              // alignment: Alignment.center,
              child: Image.asset(
                "images/Cats.jpg", fit: BoxFit.cover,
                // cacheHeight: 197,
                // cacheWidth: 246,
              ),
            ),
          ],
        );
      },
    );
  }
}
