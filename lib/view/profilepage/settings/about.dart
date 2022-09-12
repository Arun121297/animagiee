import 'package:animagieeui/config/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/controller.dart';
import '../../homepage/homepage.dart';
import 'settings.dart';

class About_Design_UI extends StatefulWidget {
  const About_Design_UI({Key? key}) : super(key: key);

  @override
  State<About_Design_UI> createState() => _About_Design_UIState();
}

class _About_Design_UIState extends State<About_Design_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            controller.clubapp(
              "About",
              Settings_Page_1_UI(),
              context,
            ),
            SizedBox(
              height: 5.0.hp,
              //  48,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            " App Information ",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 20.5.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0.hp,
                            //  24,
                            width: 5.0.wp,
                            //  24,
                            child: Image.asset(
                              "images/about.png",
                              // cacheHeight: 24,
                              // cacheWidth: 24,
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      endIndent: 20,
                      indent: 80,
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Divider(
                      endIndent: 80,
                      indent: 20,
                      color: Colors.black,
                      thickness: 1,
                    ),
                    SizedBox(height: 4.0.hp
                        // 30,
                        ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      // alignment: Alignment.center,
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing "
                        "and typesetting industry. Lorem Ipsum has been "
                        "the industry's standard dummy text ever since "
                        "the 1500s, when an unknown printer took a galley "
                        "of type and scrambled it to make a type specimen "
                        "book. It has survived not only five centuries, but "
                        "also the leap into electronic typesetting, remaining "
                        "essentially ",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 10.5.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      // alignment: Alignment.center,
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing "
                        "and typesetting industry. Lorem Ipsum has been "
                        "the industry's standard dummy text ever since "
                        "the 1500s, when an unknown printer took a galley "
                        "of type and scrambled it to make a type specimen "
                        "book. It has survived not only five centuries, but "
                        "also the leap into electronic typesetting, remaining "
                        "essentially ",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 10.5.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      // alignment: Alignment.center,
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing "
                        "and typesetting industry. Lorem Ipsum has been "
                        "the industry's standard dummy text ever since "
                        "the 1500s, when an unknown printer took a galley "
                        "of type and scrambled it to make a type specimen "
                        "book. It has survived not only five centuries, but "
                        "also the leap into electronic typesetting, remaining "
                        "essentially ",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 10.5.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      // alignment: Alignment.center,
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing "
                        "and typesetting industry. Lorem Ipsum has been "
                        "the industry's standard dummy text ever since "
                        "the 1500s, when an unknown printer took a galley "
                        "of type and scrambled it to make a type specimen "
                        "book. It has survived not only five centuries, but "
                        "also the leap into electronic typesetting, remaining "
                        "essentially ",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 10.5.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
