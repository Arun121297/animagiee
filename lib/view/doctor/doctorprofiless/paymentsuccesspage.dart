import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/homepage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/controller.dart';
import 'package:lottie/lottie.dart';

class Successfull_Payment_UI extends StatefulWidget {
  const Successfull_Payment_UI({Key? key}) : super(key: key);

  @override
  State<Successfull_Payment_UI> createState() => _Successfull_Payment_UIState();
}

class _Successfull_Payment_UIState extends State<Successfull_Payment_UI> {
  //  final AnimationController Animationcontroller;
  var giflotti = "images/mpihZSqdsf.json";
  // @override
  // void initState() {
  //   super.initState();

  //   Animationcontroller = AnimationController(vsync:  );
  // }

  // @override
  // void dispose() {
  //   Animationcontroller.dispose();
  //   super.dispose();
  // }

  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              // controller.cusapp("", context),
              SizedBox(
                height: 50.0.hp,
                //  400,
                width: 80.0.wp,
                //  400,
                child: Lottie.asset(
                  giflotti,
                  // controller: Animationcontroller,
                  // onLoaded: (composition) {
                  //   // Configure the AnimationController with the duration of the
                  //   // Lottie file and start the animation.
                  //   Animationcontroller
                  //     ..duration = composition.duration
                  //     ..forward();
                  // },
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5.0.hp,
                  ),
                  Container(
                    // color: Colors.orange,
                    width: MediaQuery.of(context).size.width,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Your appointment has been fixed to",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 11.0.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        /*defining default style is optional */
                        children: <TextSpan>[
                          TextSpan(
                            text: '  03-Mar-2022',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 10.5.sp,
                                color: animagiee_CL,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: ' Tuesday',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 11.0.sp,
                                color: animagiee_CL,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          TextSpan(text: "at"),
                          TextSpan(
                            text: '  6.00 PM.',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 10.5.sp,
                                color: animagiee_CL,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Container(
                      child: Text(
                    "Feel free to ask all your questions to our doctor...",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 9.0.sp,
                        color: text_1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
                  SizedBox(
                    height: 8.0.hp,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child:
                        controller.communityNext("Back to home", Home_Page()),

                    //  GestureDetector(
                    //   onTap: () {
                    //     Get.to(Home_Page());
                    //   },
                    //   child: Container(
                    //     height: 6.0.hp,
                    //     //  43,
                    //     width: 90.0.wp,
                    //     // 310,
                    //     decoration: BoxDecoration(
                    //         color: Color(0xff272727),
                    //         borderRadius: BorderRadius.circular(12)),
                    //     alignment: Alignment.center,
                    //     child: Text(
                    //       "Back to home ",
                    //       style: GoogleFonts.poppins(
                    //         textStyle: TextStyle(
                    //           color: const Color.fromRGBO(255, 255, 255, 1),
                    //           fontSize: 15.0.sp,
                    //           fontWeight: FontWeight.w600,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
