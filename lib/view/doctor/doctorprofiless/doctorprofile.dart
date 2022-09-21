import 'package:animagieeui/config/extension.dart';

import 'package:animagieeui/view/homepage/homepage.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../controller/controller.dart';

import '../../homeAppBar/appbar.dart';
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
              AppbarContainer(
                title: "Doctor",
                backarrow: true,
                firstscreen: false,
                navipage: null,
                notification: true,
                edit: false,
                search: true,
                chat: false,
                logo: false,
                podcast: false,
                fun: Home_Page(),
              ),

              // controller.clubapp("Doctor", Home_Page(), context),
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
