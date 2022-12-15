import 'package:animagieeui/config/extension.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/colorconfig.dart';
import '../../../../enum/enum.dart';

class Carosel_slider_Appointment_UI extends StatefulWidget {
  const Carosel_slider_Appointment_UI({Key? key}) : super(key: key);

  @override
  State<Carosel_slider_Appointment_UI> createState() =>
      _Carosel_slider_Appointment_UIState();
}

class _Carosel_slider_Appointment_UIState
    extends State<Carosel_slider_Appointment_UI> {
  var currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        height: 17.0.hp,
        //  147,
        width: MediaQuery.of(context).size.width,
        color: doctor_CL,
        child: CarouselSlider.builder(
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              onPageChanged: ((index, reason) => currentindex = index),
              viewportFraction: 0.2,
              initialPage: currentindex,
            ),
            itemCount: day.length,
            itemBuilder: (context, index, realIndex) => Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    // height: 10.0.hp,
                    //  102,
                    width: 25.0.wp,

                    decoration: BoxDecoration(
                        color: animagiee_CL,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: animagiee_CL, width: 2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              day[index],
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 14.0.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text(
                              "${index + 1}",
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
                  ),
                )
            // ],
            ),
      ),
      Container(
        height: 15.0.hp,
        //  102,
        width: 17.0.wp,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0.sp),
            border: Border.all(color: Colors.red, width: 3)),
      )
    ]);
  }
}
