import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../homeAppBar/appbar.dart';
import 'doctorconsulteddetails.dart';
import 'doctorconsultedpet.dart';
import 'doctorprofile_bg_name.dart';
import 'doctorprofiledescription.dart';
import 'doctorsappoinments.dart';
import 'myworkchat.dart';

class Doctors_Appoinment_Detaild_UI extends StatefulWidget {
  const Doctors_Appoinment_Detaild_UI({Key? key}) : super(key: key);

  @override
  State<Doctors_Appoinment_Detaild_UI> createState() =>
      _Doctors_Appoinment_Detaild_UIState();
}

class _Doctors_Appoinment_Detaild_UIState
    extends State<Doctors_Appoinment_Detaild_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            AppbarContainer(
              title: "Appointments Details",
              backarrow: true,
              firstscreen: false,
              navipage: null,
              notification: true,
              edit: false,
              search: true,
              chat: false,
              logo: false,
              podcast: false,
              fun: Appoinment_Page_UI(),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Doctor_Profile_Bg_Name_UI(),
                  Doctor_Description_Profile_UI(),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 20,
                            width: 22,
                            child: Image.asset(
                              "images/appoinmentdetails.png",
                              // cacheHeight: 20,
                              // cacheWidth: 22,
                            ),
                          ),
                        ),
                        Text(
                          "Appointment details",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 10.0.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///consulted details
                  Doctor_Consulted_Details_UI(),

                  ///checked pets imagezzzz
                  SizedBox(
                    height: 10.0.hp,
                    //  67,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.separated(
                        padding: EdgeInsets.all(8.0.sp),
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 2.0.wp
                              // 10,
                              );
                        },
                        itemCount: 6,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            Doctor_Consulted_Pet_UI()),
                  ),

                  Align(
                      alignment: Alignment.center,
                      child: controller.communityNext(
                          "Start chat", MyWork_Chat_UI()))
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
