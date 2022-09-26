import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homeAppBar/appbar.dart';
import 'package:animagieeui/view/mywork/timer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';
import '../chats/sendbox.dart';

import 'doctorappoinment2ndpage.dart';

class MyWork_Chat_UI extends StatefulWidget {
  const MyWork_Chat_UI({Key? key}) : super(key: key);

  @override
  State<MyWork_Chat_UI> createState() => _MyWork_Chat_UIState();
}

class _MyWork_Chat_UIState extends State<MyWork_Chat_UI> {
  Controller controller = Get.put(Controller());
  // var otptimer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            child: Column(
              children: [
                // Doctors_Appoinment_Detaild_UI
                // AppbarContainer(
                //     title: "Karthi",
                //     logo: false,
                //     // chat_timer: true,
                //     notification: false,
                //     search: false,
                //     backarrow: true,
                //     podcast: false,
                //     edit: false,
                //     firstscreen: false,
                //     notification_back_arrow: false,
                //     chat: false),
                myworkchatscreenapp(
                    "Karthi", Doctors_Appoinment_Detaild_UI(), context),
                Expanded(
                    child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => SizedBox(
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.green,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 7.5.hp,
                              // 60,
                              width: 54.5.wp,
                              //  199,
                              // color: Colors.black,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                          backgroundImage: ExactAssetImage(
                                              "images/doc_3.jpg")),
                                      Container(
                                        height: 4.0.hp,
                                        //  31,
                                        width: 43.0.wp,
                                        // 159,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                238, 238, 238, 1),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(20))),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "9.20am",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 7.0.sp,
                                        color: content1_CL,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 4.0.hp
                            //  16,
                            ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 7.5.hp,
                              // 60,
                              width: 45.0.wp,

                              // height: 60,
                              // width: 159,
                              // color: Colors.black,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 4.5.hp,
                                        // 60,
                                        width: 45.0.wp,

                                        // height: 31,
                                        // width: 159,
                                        decoration: BoxDecoration(
                                            color: chat_Box_CL,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(20))),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "9.20am",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 7.0.sp,
                                        color: content1_CL,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: index == 3 ? true : false,
                          child: Row(children: [
                            Expanded(child: Divider()),
                            Text(
                              "Today",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 10.0.sp,
                                  color: sendBox_CL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(child: Divider()),
                          ]),
                        )
                      ],
                    ),
                  ),
                )),

                Send_Box_UI(),
                SizedBox(height: 2.0.hp
                    //  38,
                    ),
              ],
            ),
          ),
          Obx(() {
            return Visibility(
              visible: controller.chatoption.value,
              child: Padding(
                padding: EdgeInsets.all(33.0.sp),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      height: 15.0.hp,
                      // 108,
                      width: 30.0.wp,
                      // 113,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Text(
                              "Block",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 8.0.sp,
                                  color: buttonColor1_CL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            endIndent: 10,
                            indent: 10,
                          ),
                          Container(
                            child: Text(
                              "Mute Notification",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 8.0.sp,
                                  color: buttonColor1_CL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            endIndent: 10,
                            indent: 10,
                          ),
                          Container(
                            child: Text(
                              "Complete Chat",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 8.0.sp,
                                  color: buttonColor1_CL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          })
        ]),
      ),
    );
  }

  myworkchatscreenapp(title, fun, context) {
    return Material(
      elevation: 3,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          // Back_Button_UI()
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 12.0.sp,
            ),
            onPressed: () {
              Get.to(fun);
            },
          ),
          Expanded(child: Container()),
          Expanded(child: SizedBox()),
          SizedBox(
            width: 3.0.wp,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 13.0.sp,
                backgroundColor: animagiee_CL,
                child: CircleAvatar(
                    backgroundImage: ExactAssetImage("images/doc_5.jpg"),
                    radius: 12.0.sp),
              ),
              SizedBox(
                width: 10,
              ),
              Text(title)
            ],
          ),
          Expanded(child: Container()),
          GestureDetector(
              onTap: () {
                setState(() {
                  chatTimePaymentPOPup();
                  reviewSectionPopUp();
                });
              },
              child: OtpTimer()),
          SizedBox(
            width: 3.0.wp,
          ),

          GestureDetector(
            onTap: () {
              if (controller.chatoption.value == false) {
                controller.chatoption.value = true;
              } else {
                controller.chatoption.value = false;
              }
            },
            child: SizedBox(
              height: 2.0.hp,
              // 16,
              width: 5.0.wp,
              // 16,
              child: Image.asset(
                "images/burger.png",
              ),
            ),
          ),
          SizedBox(
            width: 2.0.wp,
          )
        ]),
      ),
    );
  }

  chatTimePaymentPOPup() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Container(
                // color: Colors.green,

                height: 55.0.hp,
                //  417.0,
                width: 90.0.wp,
                //  323.0,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 90.0.wp,
                        //  323.0,
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {
                              // Get.to(My_Profile_UI());
                              // controller.selectedIndex.value = 4;
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close_rounded))),
                    SizedBox(
                        // color: Colors.blueAccent,
                        height: 25.0.hp,
                        // 194,
                        width: 60.0.wp,
                        // 194,
                        child: Image.asset("images/65014-dog-walking.gif")),
                    Text(
                      "Oop’s the session is going to end now!!!",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 11.0.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.0.hp,
                    ),
                    Text(
                      "Are you will to take an another session? Then make your payement "
                      "for the additional session now and extend your "
                      "session now...",
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 8.0.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.0.hp,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.to();
                        setState(() {});
                      },
                      child: Container(
                        height: 5.0.hp,
                        //  34,
                        width: 70.0.wp,
                        //  249,
                        decoration: BoxDecoration(
                            color: buttonColor1_CL,
                            borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        child: Text(
                          "Make Payment",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16.0.sp,
                              color: SigninButton_CL,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
        //  errorDialog
        );
  }

  reviewSectionPopUp() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12.0.sp)), //this right here
              child: Container(
                // color: Colors.green,
                height: 50.0.hp,
                //  417.0,
                width: 90.0.wp,
                //  323.0,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(children: [
                      Container(
                        height: 25.0.hp,
                        // 212,
                        width: 90.0.wp,
                        // 323,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12)),
                            image: DecorationImage(
                                image: AssetImage("images/Intersect.png"),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                          width: 90.0.wp,
                          //  323,
                          alignment: Alignment.topRight,
                          child: Transform.rotate(
                            angle: 5.5,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.add_circle_outlined)),
                          )),
                      Align(
                          heightFactor: 1.4,
                          alignment: Alignment.bottomCenter,
                          child: CircleAvatar(
                            backgroundImage:
                                ExactAssetImage("images/doc_3.jpg"),
                            radius: 50.0.sp,
                          )),
                    ]),
                    Expanded(child: SizedBox()),
                    Text(
                      "Make your ratings for"
                      "the session!!!",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 11.0.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            // var starclr;
                            return SizedBox(
                              child: GestureDetector(
                                onTap: () {
                                  print(index);
                                  setState(() {});
                                },
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 24.0.sp,
                                        color: reviewPopUp_CL,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 20.0.sp,
                                        color: Colors.white,
                                      )
                                    ]),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 3.0.hp,
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        // Get.to();
                      },
                      child: Container(
                        height: 5.0.hp,
                        //  34,
                        width: 70.0.wp,
                        //  249,
                        decoration: BoxDecoration(
                            color: buttonColor1_CL,
                            borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        child: Text(
                          "Submit",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 14,
                              color: SigninButton_CL,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    // controller.communityNext("Make Payment", null)
                  ],
                ),
              ),
            ));
  }
}
