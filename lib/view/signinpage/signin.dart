import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../intrestpage.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 280,
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            "Hello !!!",
            style: GoogleFonts.jost(
              textStyle: TextStyle(
                fontSize: 28,
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
                fontSize: 11,
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
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 75,
          ),

          ///login through FaceBook

          Container(
            height: 47,
            width: 308,
            decoration: BoxDecoration(
              color: SigninButton_CL,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.facebook,
                  color: FB_CL,
                  size: 40,
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    "Continue with facebook",
                    style: GoogleFonts.poppins(
                      color: SigninBtn_Content_CL,
                      textStyle: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 28,
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
                height: 47,
                width: 308,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.network(
                          'http://pngimg.com/uploads/google/google_PNG19635.png',
                          fit: BoxFit.cover),
                    ),
                    Text(
                      "Continue with Google",
                      style: GoogleFonts.poppins(
                        color: SigninBtn_Content_CL,
                        textStyle: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
