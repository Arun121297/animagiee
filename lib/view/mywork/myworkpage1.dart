import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/homepage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';

import '../homeAppBar/appbar.dart';

import 'appoinmentwork.dart';
import 'availabledays.dart';
import 'doctoravailabletime.dart';
import 'doctordetails.dart';
import 'doctorsappoinments.dart';
import 'mystatus.dart';
import 'myworkheader.dart';

class My_Work_Design_UI extends StatefulWidget {
  const My_Work_Design_UI({Key? key}) : super(key: key);

  @override
  State<My_Work_Design_UI> createState() => _My_Work_Design_UIState();
}

class _My_Work_Design_UIState extends State<My_Work_Design_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarContainer(
                  title: "My Work",
                  logo: false,
                  notification: true,
                  search: true,
                  backarrow: true,
                  notification_back_arrow: false,
                  podcast: false,
                  searchfunction: true,
                  searchfunctionclose: false,
                  edit: false,
                  firstscreen: false,
                  navipage: null,
                  fun: Home_Page(),
                  chat: false),
              Expanded(
                  child: SingleChildScrollView(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyWork_Header_UI(),
                      Padding(
                        padding: EdgeInsets.all(10.0.sp),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur.",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 9.5.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      List_Of_Appoinment_UI(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0.sp),
                            child: Text(
                              "Appointments",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 10.5.sp,
                                  color: Color.fromRGBO(102, 102, 102, 1),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            // color: mywork_container_CL,
                            //  Colors.amberAccent,

                            height: 13.0.hp,
                            //  83,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ListView.builder(
                                  itemCount: 3,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      Doctor_Details_List_Content(
                                        fetchindex: index,
                                      )),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              Get.to(Appoinment_Page_UI());
                            },
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              alignment: Alignment.topRight,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "View All",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 8.5.sp,
                                    color: animagiee_CL,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12.0.sp),
                            child: Text(
                              "My status",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 10.5.sp,
                                  color: Color.fromRGBO(102, 102, 102, 1),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          MyStatus_UI(),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Available Time",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 10.5.sp,
                                  color: Color.fromRGBO(102, 102, 102, 1),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Doctor_Available_Time_UI_Content(),
                          ////Available days
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Available days",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 10.5.sp,
                                  color: Color.fromRGBO(102, 102, 102, 1),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Card(
                              child: Container(
                            height: 16.0.hp,
                            //  100,
                            width: 95.0.wp,
                            // 336,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1.4,
                                crossAxisCount: 4,
                                crossAxisSpacing: 4,
                                mainAxisSpacing: 4,
                              ),
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return Doctor_Available_Days_UI(
                                  fetchindex: index,
                                );
                              },
                            ),
                          )),
                          SizedBox(height: 3.0.hp
                              // 15,
                              ),

                          ///button
                          Align(
                            alignment: Alignment.center,
                            child:
                                controller.communityNext("Update", Home_Page()),
                          ),

                          SizedBox(
                            height: 3.0.hp,
                            // 15,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
