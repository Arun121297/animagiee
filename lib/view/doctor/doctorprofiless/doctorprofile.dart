import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/doctor/doctorprofiless/payment.dart';
import 'package:animagieeui/view/homepage/homepage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';

import '../../../enum/enum.dart';
import '../doctor.dart';
import 'customizedstepper.dart';
import 'description.dart';
import 'doctoravailable.dart';
import 'header.dart';

class Doctor_Profile_UI extends StatefulWidget {
  Doctor_Profile_UI({Key? key}) : super(key: key);

  @override
  State<Doctor_Profile_UI> createState() => _Doctor_Profile_UIState();
}

class _Doctor_Profile_UIState extends State<Doctor_Profile_UI> {
  Controller controller = Get.put(Controller());

  var date;

  var stepindex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              controller.clubapp("Doctor", Home_Page(), context),
              // Profile_Header_UI(),
              Expanded(
                child: SizedBox(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Profile_Header_UI(),
                        Doctor_Description_UI(),
                        SizedBox(
                          height: 2.0.hp,
                          //  13,
                        ),
                        Available_Time_UI(),
                        SizedBox(height: 3.0.hp
                            // 15,
                            ),
                        Customized_Stepper_UI()
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
