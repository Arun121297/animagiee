import 'package:animagieeui/config/extension.dart';
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

import 'customizedstepper.dart';
import 'description.dart';
import 'doctoravailable.dart';
import 'header.dart';

class Doctor_Profile_UI extends StatelessWidget {
  Doctor_Profile_UI({Key? key}) : super(key: key);
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              controller.cusapp("Doctor", context),
              Expanded(
                child: SizedBox(
                  child: Column(
                    children: [
                      Profile_Header_UI(),
                      Doctor_Description_UI(),
                      SizedBox(
                        height: 13,
                      ),
                      Available_Time_UI(),
                      SizedBox(
                        height: 15,
                      ),
                      Customized_Stepper_UI()
                    ],
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
