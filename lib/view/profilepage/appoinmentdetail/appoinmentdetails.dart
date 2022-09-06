import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'completedappoinment.dart';

class AppoinmentDetails_UI extends StatefulWidget {
  const AppoinmentDetails_UI({Key? key}) : super(key: key);

  @override
  State<AppoinmentDetails_UI> createState() => _AppoinmentDetails_UIState();
}

class _AppoinmentDetails_UIState extends State<AppoinmentDetails_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              controller.clubapp("Appoinment Details", Home_Page(), context),
              SizedBox(
                height: 2.0.hp,
              ),
              ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(DoctorAppoinmentDetails_Completed_UI());
                    },
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                            height: 15.0.hp,
                            // 110,
                            width: 90.0.wp,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 13.0.hp,
                                  // 100,
                                  width: 20.0.wp,
                                  //  69,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: AssetImage(
                                        "images/doc_2.jpg",
                                      ))),
                                  // child: Image.asset(
                                  //   "images/doc_2.jpg",
                                  //   cacheHeight: 100,
                                  //   cacheWidth: 69,
                                  // ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Dr.Meena"),
                                    Text(
                                      "Lorem Ipsum is simply dummy\ntext of the printing and ...",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 6.0.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: animagiee_CL,
                                                size: 16.0.sp,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: 14.0.sp,
                                              ),
                                            ]),
                                        Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: animagiee_CL,
                                                size: 16.0.sp,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: 14.0.sp,
                                              ),
                                            ]),
                                        Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: animagiee_CL,
                                                size: 16.0.sp,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: 14.0.sp,
                                              ),
                                            ]),
                                        Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: animagiee_CL,
                                                size: 16.0.sp,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: 14.0.sp,
                                              ),
                                            ]),
                                        Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: animagiee_CL,
                                                size: 16.0.sp,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: 14.0.sp,
                                              ),
                                            ]),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 5.0.hp,
                                      //  36,
                                      width: 25.0.wp,
                                      //  81,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: animagiee_CL),
                                      child: Text(
                                        "Details",
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 8.0.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Completed",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.green,
                                          fontSize: 9.0.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "2 Feb",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 7.0.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                            // ListTile(
                            //   trailing: Column(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Container(
                            //         height: 36,
                            //         width: 81,
                            //         color: animagiee_CL,
                            //         child: Text("Details"),
                            //       ),
                            //       Text("tr"),
                            //       Text("2 Feb")
                            //     ],
                            //   ),
                            //   isThreeLine: true,
                            //   leading: Text("leading"),
                            //   subtitle: Text("Sub"),
                            //   title: Text("titl"),
                            // ),
                            )),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
