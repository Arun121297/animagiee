import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/enum/enum.dart';
import 'package:animagieeui/view/doctor/doctorprofiless/paymentsuccesspage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';
import 'payment.dart';

class Customized_Stepper_UI extends StatefulWidget {
  const Customized_Stepper_UI({Key? key}) : super(key: key);

  @override
  State<Customized_Stepper_UI> createState() => _Customized_Stepper_UIState();
}

class _Customized_Stepper_UIState extends State<Customized_Stepper_UI> {
  var date;
  var stepindex = 1;
  // List steperbool = [false, false];
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 400,
      // color: Colors.green,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                      child: Icon(
                        Icons.done,
                        size: 9.0.sp,
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
                        fontSize: 9.5.sp,
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
                        visible:
                            stepindex == 2 || stepindex == 3 ? true : false,
                        child: Icon(
                          Icons.done,
                          size: 9.0.sp,
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
                        fontSize: 9.5.sp,
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
                        visible: stepindex == 3 ? true : false,
                        child: Icon(
                          Icons.done,
                          size: 9.0.sp,
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
                        fontSize: 9.5.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          stepindex == 1
              ? stepper1()
              : stepindex == 2
                  ? stepper2()
                  : stepindex == 3
                      ? stepper3()
                      : SizedBox(),
          SizedBox(
            height: 1.0.hp,
          ),
        ],
      ),
    );
  }

  Widget stepper1() {
    return Container(
      // color: Colors.orange,
      child: Column(
        children: [
          SizedBox(
            height: 2.2.hp,
            //  20,
          ),
          Row(
            children: [
              SizedBox(
                width: 2.0.wp,
              ),
              Icon(Icons.calendar_month_outlined),
              SizedBox(
                width: 2.0.wp,
              ),
              Text(
                "Date of appointment",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 11.0.sp,
                    color: text_1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.0.hp,
          ),
          Container(
            height: 17.0.hp,
            //  147,
            width: MediaQuery.of(context).size.width,
            color: doctor_CL,
            child: CarouselSlider(
              // carouselController: buttonCarouselController,
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.3,
                aspectRatio: 3.0,
                initialPage: 0,
              ),

              items: [
                for (date = 01; date < 31; date++)
                  Container(
                    height: 10.0.hp,
                    //  102,
                    width: 25.0.wp,
                    // 83,
                    // alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: animagiee_CL,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.red, width: 2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              day[date],
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 14.0.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text(
                              "$date",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 14.0.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
          SizedBox(
            height: 2.0.hp,
            //  20,
          ),
          Row(
            children: [
              SizedBox(
                width: 2.0.wp,
              ),
              Icon(Icons.alarm),
              SizedBox(
                width: 2.0.wp,
              ),
              Text(
                "Time of appointment",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 11.0.sp,
                    color: text_1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 2.0.hp,
            // 10,
          ),
          Container(
            height: 29.0.hp,
            //  220,
            width: MediaQuery.of(context).size.width,
            color: doctor_CL,
            alignment: Alignment.center,
            child: GridView.builder(
                physics: ScrollPhysics(),
                padding: EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  // childAspectRatio: 5,
                  mainAxisExtent: 47,
                  // crossAxisSpacing: 40,
                  mainAxisSpacing: 3,
                ),
                itemCount: TimeOFAppoinment.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (TimeOFAppoinment[index] == false) {
                          TimeOFAppoinment[index] = true;
                        } else {
                          TimeOFAppoinment[index] = false;
                        }
                        setState(() {});
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0.sp)),
                      color: TimeOFAppoinment[index] == true
                          ? Colors.red
                          : animagiee_CL,
                      child: Center(
                        child: Text(
                          time[index],
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 9.0.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          button()
        ],
      ),
    );
  }

  Widget stepper2() {
    return SizedBox(
      // height: 300,
      // color: Colors.black,
      child: Column(children: [
        SizedBox(height: 3.0.hp
            //  30,
            ),
        Container(
          margin: EdgeInsets.only(left: 10.0.sp),
          child: Row(
            children: [
              SizedBox(
                  height: 3.0.hp,
                  //  21,
                  width: 8.0.wp,
                  //  21,
                  child: Image.asset(
                    "images/about.png",
                    color: Colors.black,
                  )),
              SizedBox(
                width: 2.0.wp,
              ),
              // Icon(Icons.warning),
              Text(
                "Pet Information",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.5.sp,
                    color: stepper_2_text_CL,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.0.hp
            // 18,
            ),
        Container(
          height: 50.0.hp,
          // 423,
          width: MediaQuery.of(context).size.width,
          color: doctor_CL,
          padding: EdgeInsets.all(8.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.0.hp,
                // 29,
              ),
              Text(
                "Pet Name",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.0.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 1.0.hp,
                //  10,
              ),
              SizedBox(
                height: 5.0.hp,
                //  40,
                child: TextField(
                  decoration: new InputDecoration(
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: animagiee_CL, width: 0.0),
                    ),
                    // focusedBorder: ...
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.sp)),
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 2.0.hp,
              ),
              Text(
                "Pet Type ",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.0.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 1.0.hp,
              ),
              SizedBox(
                height: 5.0.hp,
                //  40,
                child: TextField(
                  decoration: new InputDecoration(
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: animagiee_CL, width: 0.0),
                    ),
                    // focusedBorder: ...
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 2.0.hp,
              ),
              Text(
                "Problem description ",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.0.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 1.0.hp,
              ),
              SizedBox(
                height: 10.0.hp,
                // 80,
                child: TextField(
                  decoration: new InputDecoration(
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: animagiee_CL, width: 0.0),
                    ),
                    // focusedBorder: ...
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0.sp)),
                    fillColor: Colors.white,
                  ),
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Text(
                "Upload images / videos",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.0.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 1.0.hp,
              ),
              Container(
                height: 5.0.hp,
                // 38,
                width: 45.0.wp,
                // 197,
                decoration: BoxDecoration(
                  color: animagiee_CL,
                  borderRadius: BorderRadius.circular(10.0.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Upload",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 11.0.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.0.wp,
                      // 10,
                    ),
                    Icon(
                      Icons.file_upload_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        button()
      ]),
    );
  }

  Widget stepper3() {
    return Column(
      children: [
        SizedBox(
          height: 5.0.hp,
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Icon(Icons.fact_check_outlined),
              SizedBox(
                width: 2.0.wp,
              ),
              Text(
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
            ],
          ),
        ),
        SizedBox(
          height: 2.0.hp,
        ),
        Container(
          height: 63.0.hp, //  434,
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
                  width: 84.5.wp,
                  //  300,
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
                            SizedBox(width: 7.0.wp
                                // 26,
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
                            SizedBox(width: 9.0.wp
                                // 33,
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
                            SizedBox(width: 14.0.wp
                                //  54,
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
                            SizedBox(width: 20.0.wp
                                // 70,
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
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0.sp)),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: animagiee_CL, width: 1),
                      borderRadius: BorderRadius.circular(10.0.sp)),
                  height: 5.0.hp,
                  // 38,
                  width: 85.0.wp,
                  // 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Time Duration",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 11.0.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        "15 minutes",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 11.0.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0.sp)),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: animagiee_CL, width: 1),
                      borderRadius: BorderRadius.circular(10.0.sp)),
                  height: 5.0.hp,
                  // 38,
                  width: 85.0.wp,
                  // 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Total amount",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 11.0.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        "₹ 300",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 11.0.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        button()
      ],
    );
  }

  button() {
    return Column(
      children: [
        SizedBox(
          height: 1.0.hp,
        ),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              setState(() {
                // steperbool[0] = true;
                stepindex = stepindex + 1;
                if (stepindex > 3) {
                  // print("wowww");
                  // Get.to(Doctor_Payment_UI());
                  Get.to(Successfull_Payment_UI());
                }
              });
            },
            child: Container(
              height: 6.0.hp,
              //  43,
              width: 90.0.wp,
              // 310,
              decoration: BoxDecoration(
                  color: Color(0xff272727),
                  borderRadius: BorderRadius.circular(12.0.sp)),
              alignment: Alignment.center,
              child: Text(
                stepindex == 3 ? "Make Payment" : "Next",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 15.0.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
