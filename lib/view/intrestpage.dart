import 'package:animagieeui/config/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/colorconfig.dart';
import '../controller/controller.dart';
import 'communitypage/communiti.dart';
import 'homepage/homepage.dart';
import 'homepage/homepagewidget.dart';

class Welcome_Page extends StatefulWidget {
  const Welcome_Page({Key? key}) : super(key: key);

  @override
  State<Welcome_Page> createState() => _Welcome_PageState();
}

class _Welcome_PageState extends State<Welcome_Page> {
  List Catagaries = [
    "images/Cats.jpg",
    "images/Dogs.jpg",
    "images/Exotic_Birds.jpg",
    "images/Fishes.jpg",
    "images/horse.jpg",
    "images/Livestock.jpg",
    "images/Mammals.jpg",
    "images/Poultry.jpg",
    "images/Reptiles_and_Amphibians.jpg",
  ];
  List CataName = [
    "Cats",
    "Dogs",
    "Exotic_Birds",
    "Fishes",
    "horse",
    "Livestock",
    "Mammals",
    "Poultry",
    "Reptiles&Amphibians"
  ];
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          // margin: EdgeInsets.only(top: 30),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 20, top: 30),
                      child: Text(
                        "Welcome !",
                        style: GoogleFonts.jost(
                          textStyle: TextStyle(
                            fontSize: 24.0.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      Get.to(Home_Page());
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      alignment: Alignment.center,
                      width: 22.0.wp,
                      //  80,
                      height: 4.0.hp,
                      //  35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        color: animagiee_CL,
                      ),
                      child: Text(
                        "Skip",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 10.0.sp,
                            color: skip_CL,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 85, top: 3),
                child: Text(
                  "Let us know what you’re interested in",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 10.0.sp,
                      color: dummycontent_Cl,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),

              ///gif
              Container(
                height: 30.0.hp,
                //  255,
                width: 65.0.wp,
                // 255,
                child: Image.asset("images/Curious.gif"),
              ),
              Community_UI(),
              SizedBox(
                height: 3.0.hp,
                //  30,
              ),
              controller.communityNext("Next", Home_Page())
            ],
          ),
        ),
      ),
    );
  }
}
