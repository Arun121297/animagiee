import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';
import '../../doctor/doctorprofiless/description.dart';
import '../../doctor/doctorprofiless/header.dart';
import '../../homeAppBar/appbar.dart';
import 'appoinmentdetails.dart';
// import 'payment.dart';

class DoctorAppoinmentDetails_Completed_UI extends StatefulWidget {
  const DoctorAppoinmentDetails_Completed_UI({Key? key}) : super(key: key);

  @override
  State<DoctorAppoinmentDetails_Completed_UI> createState() =>
      _DoctorAppoinmentDetails_Completed_UIState();
}

class _DoctorAppoinmentDetails_Completed_UIState
    extends State<DoctorAppoinmentDetails_Completed_UI> {
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // height: 400,
          // color: Colors.green,
          child: Column(
            children: [
              AppbarContainer(
                title: " Doctor",
                backarrow: true,
                chat: false,
                notification: true,
                search: true,
                logo: false,
                edit: false,
                firstscreen: false,
                navipage: null,
                podcast: false,
                fun: AppoinmentDetails_UI(),
              ),
              //     AppbarContainer(
              //   title: " Doctor",
              //   backarrow: true,
              //   chat: false,
              //   notification: true,
              //   search: true,
              //   logo: false,
              //   podcast: false,
              //   fun: AppoinmentDetails_UI(),
              // ),
              // controller.clubapp("Doctor", AppoinmentDetails_UI(), context),
              Expanded(
                  child: SingleChildScrollView(
                child: SizedBox(
                    child: Column(
                  children: [
                    Container(
                      // color: Colors.black,
                      height: 22.0.hp,
                      //  168,
                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/doc_3.jpg"),
                                  fit: BoxFit.cover),
                              // color: animagiee_CL,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.0.sp),
                                  bottomRight: Radius.circular(15.0.sp))),
                          width: MediaQuery.of(context).size.width,
                          height: 13.0.hp,
                          // 108,
                          // child: Image.asset("images/Dogs.jpg", fit: BoxFit.cover),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              // image: DecorationImage(
                              //     image: AssetImage("images/doc_3.jpg"),
                              //     fit: BoxFit.cover),
                              color: Colors.black38,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.0.sp),
                                  bottomRight: Radius.circular(15.0.sp))),
                          width: MediaQuery.of(context).size.width,
                          height: 13.0.hp,
                          // 108,
                          // child: Image.asset("images/Dogs.jpg", fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.0.sp, left: 20.0.sp),
                          child: Align(
                            heightFactor: 1.4,
                            alignment: Alignment.centerLeft,
                            child: CircleAvatar(
                              radius: 42.0.sp,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                backgroundImage:
                                    ExactAssetImage("images/doc_2.jpg"),
                                // backgroundColor: animagiee_CL,
                                radius: 40.0.sp,
                              ),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 50, bottom: 15),
                        //   child: Align(
                        //     alignment: Alignment.bottomLeft,
                        //     child: Container(
                        //       margin: EdgeInsets.only(left: 40),
                        //       height: 31,
                        //       width: 27,
                        //       child: Image.asset("images/badge_1.png"),
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.all(70.0.sp),
                          child: Container(
                              margin: EdgeInsets.only(left: 53),
                              child: Text(
                                "Dr.Meena",
                                style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                    fontSize: 19.5.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: 35.0.sp, right: 10.0.sp),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(child: SizedBox()),
                                SizedBox(
                                  width: 25.0.wp,
                                  // 80,
                                ),
                                // Text("₹ 300 - 15 mins"),
                                Expanded(child: SizedBox()),
                                // SizedBox(
                                //   width: 17,
                                // ),
                                Stack(alignment: Alignment.center, children: [
                                  Icon(
                                    Icons.star,
                                    color: animagiee_CL,
                                    size: 15.0.sp,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 12.5.sp,
                                  ),
                                ]),
                                Stack(alignment: Alignment.center, children: [
                                  Icon(
                                    Icons.star,
                                    color: animagiee_CL,
                                    size: 15.0.sp,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 12.5.sp,
                                  ),
                                ]),
                                Stack(alignment: Alignment.center, children: [
                                  Icon(
                                    Icons.star,
                                    color: animagiee_CL,
                                    size: 15.0.sp,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 12.5.sp,
                                  ),
                                ]),
                                Stack(alignment: Alignment.center, children: [
                                  Icon(
                                    Icons.star,
                                    color: animagiee_CL,
                                    size: 15.0.sp,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 12.5.sp,
                                  ),
                                ]),
                                Stack(alignment: Alignment.center, children: [
                                  Icon(
                                    Icons.star,
                                    color: animagiee_CL,
                                    size: 15.0.sp,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 12.5.sp,
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        )
                      ]),
                    ),
                    Doctor_Description_UI(),
                    SizedBox(
                      height: 5.0.hp,
                      //  37,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            //
                            Stack(alignment: Alignment.center, children: [
                              CircleAvatar(
                                radius: 8.5.sp,
                                backgroundColor: animagiee_CL,
                              ),
                              CircleAvatar(
                                radius: 6.0.sp,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.done,
                                  size: 8.5.sp,
                                  color: Colors.red,
                                ),
                              ),
                            ]),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Schedule",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 8.5.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "------------",
                          style: TextStyle(color: Colors.red),
                        ),
                        Column(
                          children: [
                            Stack(alignment: Alignment.center, children: [
                              CircleAvatar(
                                radius: 8.5.sp,
                                backgroundColor: animagiee_CL,
                              ),
                              CircleAvatar(
                                radius: 6.0.sp,
                                backgroundColor: Colors.white,
                                child: Visibility(
                                  visible: true,
                                  // stepindex == 2 || stepindex == 3 ? true : false,
                                  child: Icon(
                                    Icons.done,
                                    size: 8.0.sp,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ]),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Pet information",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 8.5.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "------------",
                          style: TextStyle(color: Colors.red),
                        ),
                        Column(
                          children: [
                            Stack(alignment: Alignment.center, children: [
                              CircleAvatar(
                                radius: 8.5.sp,
                                backgroundColor: animagiee_CL,
                              ),
                              CircleAvatar(
                                radius: 6.0.sp,
                                backgroundColor: Colors.white,
                                child: Visibility(
                                  visible: true,
                                  //  stepindex == 3 ? true : false,
                                  child: Icon(
                                    Icons.done,
                                    size: 8.0.sp,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ]),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Checkout",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 8.5.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Row(
                        children: [
                          Text(
                            "Appointment successfully Completed",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 11.5.sp,
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.done,
                            color: Colors.green,
                            size: 18.0.sp,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0.sp),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 4.0.hp,
                            // 17,
                            width: 5.0.wp,
                            //  17,
                            child: Image.asset("images/appoinmentdetails.png"),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 5.0.sp),
                            child: Text(
                              "Appointment details",
                              // textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 10.0.sp,
                                  color: stepper_2_text_CL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    stepper3(),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                  ],
                )),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget stepper3() {
    return Container(
      height: 45.0.hp, //  434,
      color: doctor_CL,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 38.0.sp),
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
                borderRadius: BorderRadius.circular(10.0.sp)),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0.sp),
                  border: Border.all(color: animagiee_CL, width: 1)),
              height: 38.0.hp,
              // 242,
              width: 90.5.wp,
              //  300,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 31.0.wp,
                          child: Text(
                            "Date",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 9.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0.wp,
                        ),
                        Text(":"),
                        SizedBox(
                          width: 2.0.wp,
                        ),
                        SizedBox(
                          width: 42.0.wp,
                          child: Text(
                            "3-march-2022",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 9.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 31.0.wp,
                          child: Text(
                            "Day",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 9.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0.wp,
                        ),
                        Text(":"),
                        SizedBox(
                          width: 2.0.wp,
                        ),
                        Text(
                          "Tuesday",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 9.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 31.0.wp,
                          child: Text(
                            "Time",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 9.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0.wp,
                        ),
                        Text(":"),
                        SizedBox(
                          width: 2.0.wp,
                        ),
                        SizedBox(
                          width: 42.0.wp,
                          child: Text(
                            "6.00 PM",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 9.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 31.0.wp,
                          child: Text(
                            "Pet Name",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 9.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0.wp,
                        ),
                        Text(":"),
                        SizedBox(
                          width: 2.0.wp,
                        ),
                        Container(
                          width: 42.0.wp,
                          child: Text(
                            "Johnney",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 9.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 31.0.wp,
                          child: Text(
                            "Pet Type",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 9.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0.wp,
                        ),
                        Text(":"),
                        SizedBox(
                          width: 2.0.wp,
                        ),
                        SizedBox(
                          width: 42.0.wp,
                          child: Text(
                            "Dog",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 9.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 31.0.wp,
                          child: Text(
                            "Problem description ",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 9.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0.wp,
                        ),
                        Text(":"),
                        SizedBox(
                          width: 2.0.wp,
                        ),
                        SizedBox(
                          width: 42.0.wp,
                          child: Text(
                            "Lorem Ipsum is simply"
                            "dummy text of the printing"
                            "and typesetting industry."
                            "Lorem Ipsum........",
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 9.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
