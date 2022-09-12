import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../intrestpage.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.0.hp,
              //  280,
              child: Image.asset("images/Good_doggy.gif"),
            ),
            SizedBox(
              height: 10.0.hp,
              //  60,
            ),
            Text(
              "Hello !!!",
              style: GoogleFonts.jost(
                textStyle: TextStyle(
                  fontSize: 26.5.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Text(
              "Welcome to Animagie the best place to share the love ",
              style: GoogleFonts.poppins(
                color: WelcomeContent_Cl,
                textStyle: TextStyle(
                  fontSize: 9.5.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "about your pets... ",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: WelcomeContent_Cl,
                  fontSize: 9.5.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 9.0.hp,
              //  75,
            ),

            ///login through FaceBook

            Container(
              height: 6.0.hp,
              // 47,
              width: 90.0.wp,
              // 308,
              decoration: BoxDecoration(
                color: SigninButton_CL,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 4.0.wp,
                  ),
                  Icon(
                    Icons.facebook,
                    color: FB_CL,
                    size: 40,
                  ),
                  // SizedBox(
                  //   width: 9.0.wp,
                  // ),
                  Expanded(child: SizedBox()),
                  Text(
                    "Continue with facebook",
                    style: GoogleFonts.poppins(
                      color: SigninBtn_Content_CL,
                      textStyle: TextStyle(
                        fontSize: 9.5.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3.0.hp,
                    // 28,
                  ),
                  Expanded(child: SizedBox())
                ],
              ),
            ),
            SizedBox(
              height: 3.0.hp,
              // 28,
            ),

            ///login through Google

            GestureDetector(
              onTap: () {
                Get.to(
                  () => Welcome_Page(),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: SigninButton_CL,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 6.0.hp,
                  // 47,
                  width: 90.0.wp,
                  // 308,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 3.3.wp,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        // backgroundImage: ExactAssetImage('images/Google__G__Logo.svg.webp'),
                        child:
                            Image.asset('images/GGogle.png', fit: BoxFit.cover),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        "Continue with Google",
                        style: GoogleFonts.poppins(
                          color: SigninBtn_Content_CL,
                          textStyle: TextStyle(
                            fontSize: 9.5.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4.0.hp,
                        // 28,
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
