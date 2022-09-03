import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/homepage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/controller.dart';

class Successfull_Payment_UI extends StatefulWidget {
  const Successfull_Payment_UI({Key? key}) : super(key: key);

  @override
  State<Successfull_Payment_UI> createState() => _Successfull_Payment_UIState();
}

class _Successfull_Payment_UIState extends State<Successfull_Payment_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              controller.cusapp("", context),
              SizedBox(
                height: 400,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 48,
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
                            fontSize: 12,
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
                                fontSize: 12,
                                color: animagiee_CL,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: ' Tuesday',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 12,
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
                                fontSize: 12,
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
                    height: 16,
                  ),
                  Container(
                      child: Text(
                    "Feel free to ask all your questions to our doctor...",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 10,
                        color: text_1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
                  SizedBox(
                    height: 85,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(Home_Page());
                      },
                      child: Container(
                        height: 6.0.hp,
                        //  43,
                        width: 90.0.wp,
                        // 310,
                        decoration: BoxDecoration(
                            color: Color(0xff272727),
                            borderRadius: BorderRadius.circular(12)),
                        alignment: Alignment.center,
                        child: Text(
                          "Back to home ",
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
