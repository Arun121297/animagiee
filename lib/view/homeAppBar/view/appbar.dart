import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/Appbar/appbarcontroller.dart';
import 'package:animagieeui/controller/controller.dart';
// import 'package:animagieeui/view/homeAppBar/view/prot.dart';
import 'package:animagieeui/view/homeAppBar/view/search.dart';
import 'package:animagieeui/view/profilepage/controller/profilecontroller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';
import '../../mywork/view/timer.dart';
import '../../profilepage/view/editprofilepage.dart';
import 'chat.dart';
import 'prot.dart';
// import 'chat.dart';
import 'notification.dart';

class AppbarContainer extends StatefulWidget {
  var title;
  bool logo;
  bool backarrow;
  var fun;
  bool chat;
  bool podcast;
  bool search;
  bool notification;
  bool edit;
  bool firstscreen;
  var navipage;
  bool notification_back_arrow;
  var searchfunction;
  var searchfunctionclose;
  var searchlist;
  // var notification_Function;

  AppbarContainer(
      {Key? key,
      this.title,
      this.searchfunction,
      this.searchfunctionclose,
      this.searchlist,
      required this.logo,
      required this.notification,
      required this.search,
      required this.backarrow,
      required this.podcast,
      this.fun,
      required this.edit,
      this.navipage,
      required this.firstscreen,
      required this.notification_back_arrow,
      required this.chat})
      : super(key: key);

  @override
  State<AppbarContainer> createState() => _AppbarContainerState();
}

class _AppbarContainerState extends State<AppbarContainer> {
  Controller controller = Get.put(Controller());
  AppbarController appbarController = Get.put(AppbarController());
  @override
  Widget build(BuildContext context) {
    // widget.searchfunction = true;
    return Material(
      elevation: 3,
      child: SizedBox(
        height: 7.0.hp,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Visibility(
              visible: widget.searchfunction,
              child: Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        ///logo
                        Visibility(
                          visible: widget.logo,
                          child: Container(
                            margin: EdgeInsets.only(left: 10.0.sp),
                            width: 30.0.wp,
                            // 122,
                            height: 28.0.hp,
                            child: Image.asset("images/ani.png"),
                          ),
                        ),

                        ///notificatiobackarrow
                        Visibility(
                          visible: widget.notification_back_arrow,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              size: 12.0.sp,
                            ),
                            onPressed: () {
                              setState(() {
                                // widget.notification_Function;
                                Navigator.pop(context);
                              });
                            },
                          ),
                        ),

                        //balance screen back arrow

                        Visibility(
                          visible: widget.backarrow,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              size: 12.0.sp,
                            ),
                            onPressed: () {
                              Get.to(widget.fun);
                            },
                          ),
                        ),
                        //firstscreen backarrow
                        Visibility(
                          visible: widget.firstscreen,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              size: 12.0.sp,
                            ),
                            onPressed: () {
                              controller.selectedIndex.value = widget.navipage;
                              // Get.to(widget.fun);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///logo hide spacer
                  Visibility(
                    visible: widget.logo == false ? true : false,
                    child: SizedBox(
                      width: 7.0.wp,
                    ),
                  ),

                  ///(logo backarrow chat podcast notification edit) => false => spacer
                  Visibility(
                    visible: widget.logo == false &&
                            widget.backarrow == false &&
                            widget.chat == false &&
                            widget.podcast == false &&
                            widget.notification == false &&
                            widget.edit == false
                        ? true
                        : false,
                    child: SizedBox(
                      width: 11.0.wp,
                    ),
                  ),
                  Expanded(
                    // flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      height: 7.0.hp,
                      child: Text(
                        widget.title,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 10.5.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  ///otpTimer startchat
                  // Visibility(
                  //   visible: false,
                  //   child: SizedBox(
                  //     child: Row(
                  //       children: [
                  //         // Expanded(child: Container()),
                  //         GestureDetector(
                  //             onTap: () {
                  //               setState(() {
                  //                 reviewSectionPopUp();
                  //               });
                  //             },
                  //             child: OtpTimer()),
                  //         SizedBox(
                  //           width: 3.0.wp,
                  //         ),
                  //         GestureDetector(
                  //           onTap: () {
                  //             if (controller.chatoption.value == false) {
                  //               controller.chatoption.value = true;
                  //             } else {
                  //               controller.chatoption.value = false;
                  //             }
                  //           },
                  //           child: SizedBox(
                  //             height: 2.0.hp,
                  //             // 16,
                  //             width: 5.0.wp,
                  //             // 16,
                  //             child: Image.asset(
                  //               "images/burger.png",
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 2.0.wp,
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Visibility(
                      visible: widget.notification_back_arrow,
                      child: SizedBox(
                        width: 12.0.wp,
                      )),

                  ///only notification
                  Visibility(
                    visible: widget.search == false &&
                            widget.chat == false &&
                            widget.podcast == false &&
                            widget.notification == true &&
                            widget.edit == false &&
                            widget.firstscreen == false &&
                            widget.backarrow == true &&
                            widget.logo == false
                        ? true
                        : false,
                    child: SizedBox(
                      width: 13.0.wp,
                    ),
                  ),
                  Visibility(
                    visible: widget.search == false &&
                            widget.chat == false &&
                            widget.podcast == false &&
                            widget.notification == false &&
                            widget.edit == false
                        ? true
                        : false,
                    child: SizedBox(
                      width: 18.0.wp,
                    ),
                  ),
                  // SizedBox(width: 100, height: 6.0.hp, child: const TextField()),

                  // Visibility(
                  //     visible: widget.search && appbarController.searchfield.value,
                  //     child: SizedBox(height: 10, width: 90, child: TextFormField())),
                  SizedBox(
                    height: 7.0.hp,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Visibility(
                          visible: widget.search,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.searchlist;
                                  widget.searchfunction = false;
                                  widget.searchfunctionclose = true;
                                });
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Colors.black,
                              )),
                        ),
                        Visibility(
                            visible: widget.chat, child: const Chat_Icon_UI()),
                        Visibility(
                            visible: widget.podcast, child: const PodCast_UI()),
                        Visibility(
                            visible: widget.notification,
                            child: const Notification_UI()),
                        // SizedBox(
                        //   width: 4.0.wp,
                        // )
                      ],
                    ),
                  ),

                  Visibility(
                    visible: widget.edit,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(const Edit_Profile_UI());
                      },
                      child: Container(
                        height: 3.3.hp,
                        //  20,
                        width: 20.0.wp,
                        // 70,
                        decoration: BoxDecoration(
                            color: animagiee_CL,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Edit",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 9.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.0.hp,
                              width: 3.0.wp,
                              child: Image.asset(
                                "images/editicon.png",
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2.0.wp,
                  )
                ],
              ),
            ),
            Visibility(
                visible: widget.searchfunctionclose,
                child: SizedBox(
                    height: 6.0.hp,
                    // width: 300,
                    child: Row(
                      children: [
                        SizedBox(
                            height: 6.0.hp,
                            width: 300,
                            child: const TextField()),
                        SizedBox(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.searchfunction = true;
                                  widget.searchfunctionclose = false;
                                });
                              },
                              icon: const Icon(Icons.close)),
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  // reviewSectionPopUp() {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) => Dialog(
  //             shape: RoundedRectangleBorder(
  //                 borderRadius:
  //                     BorderRadius.circular(12.0.sp)), //this right here
  //             child: Container(
  //               // color: Colors.green,
  //               height: 50.0.hp,
  //               //  417.0,
  //               width: 90.0.wp,
  //               //  323.0,
  //               child: Column(
  //                 // mainAxisAlignment: MainAxisAlignment.center,
  //                 children: <Widget>[
  //                   Stack(children: [
  //                     Container(
  //                       height: 25.0.hp,
  //                       // 212,
  //                       width: 90.0.wp,
  //                       // 323,
  //                       decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.only(
  //                               topRight: Radius.circular(12),
  //                               topLeft: Radius.circular(12)),
  //                           image: DecorationImage(
  //                               image: AssetImage("images/Intersect.png"),
  //                               fit: BoxFit.cover)),
  //                     ),
  //                     Container(
  //                         width: 90.0.wp,
  //                         //  323,
  //                         alignment: Alignment.topRight,
  //                         child: Transform.rotate(
  //                           angle: 5.5,
  //                           child: IconButton(
  //                               onPressed: () {
  //                                 Navigator.pop(context);
  //                               },
  //                               icon: Icon(Icons.add_circle_outlined)),
  //                         )),
  //                     Align(
  //                         heightFactor: 1.4,
  //                         alignment: Alignment.bottomCenter,
  //                         child: CircleAvatar(
  //                           radius: 50.0.sp,
  //                         )),
  //                   ]),
  //                   Expanded(child: SizedBox()),
  //                   Text(
  //                     "Make your ratings for"
  //                     "the session!!!",
  //                     maxLines: 2,
  //                     textAlign: TextAlign.center,
  //                     style: GoogleFonts.poppins(
  //                       textStyle: TextStyle(
  //                         fontSize: 11.0.sp,
  //                         color: Colors.black,
  //                         fontWeight: FontWeight.w500,
  //                       ),
  //                     ),
  //                   ),
  //                   Expanded(
  //                     child: ListView.builder(
  //                         shrinkWrap: true,
  //                         scrollDirection: Axis.horizontal,
  //                         itemCount: 5,
  //                         itemBuilder: (context, index) {
  //                           // var starclr;
  //                           return SizedBox(
  //                             child: GestureDetector(
  //                               onTap: () {
  //                                 print(index);
  //                                 setState(() {});
  //                               },
  //                               child: Stack(
  //                                   alignment: Alignment.center,
  //                                   children: [
  //                                     Icon(
  //                                       Icons.star,
  //                                       size: 24.0.sp,
  //                                       color: reviewPopUp_CL,
  //                                     ),
  //                                     Icon(
  //                                       Icons.star,
  //                                       size: 20.0.sp,
  //                                       color: Colors.white,
  //                                     )
  //                                   ]),
  //                             ),
  //                           );
  //                         }),
  //                   ),
  //                   SizedBox(
  //                     height: 3.0.hp,
  //                   ),

  //                   GestureDetector(
  //                     onTap: () {
  //                       // Get.to();
  //                     },
  //                     child: Container(
  //                       height: 5.0.hp,
  //                       //  34,
  //                       width: 70.0.wp,
  //                       //  249,
  //                       decoration: BoxDecoration(
  //                           color: buttonColor1_CL,
  //                           borderRadius: BorderRadius.circular(15)),
  //                       alignment: Alignment.center,
  //                       child: Text(
  //                         "Submit",
  //                         style: GoogleFonts.poppins(
  //                           textStyle: TextStyle(
  //                             fontSize: 14,
  //                             color: SigninButton_CL,
  //                             fontWeight: FontWeight.w600,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Expanded(child: SizedBox()),
  //                   // controller.communityNext("Make Payment", null)
  //                 ],
  //               ),
  //             ),
  //           ));
  // }
}
