import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/chats/chat.dart';
import 'package:animagieeui/view/userprofile/page1userpost.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';
import '../animagieeprofile/animalsprofiles.dart';

import 'followers.dart';
import 'following.dart';
import 'page2communitie.dart';
import 'settings.dart';

class User_Profile extends StatefulWidget {
  const User_Profile({Key? key}) : super(key: key);

  @override
  State<User_Profile> createState() => _User_ProfileState();
}

class _User_ProfileState extends State<User_Profile> {
  Controller controller = Get.put(Controller());
  PageController pageController = PageController();
  var pagechange;
  @override
  void initState() {
    pagechange = 0;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Material(
            //   elevation: 3,
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     child: Row(children: [
            //       // Back_Button_UI(),
            //       IconButton(
            //         icon: Icon(
            //           Icons.arrow_back_ios_new,
            //           size: 12.0.sp,
            //         ),
            //         onPressed: () {
            //           Get.to(Animals_Profiles_UI());
            //         },
            //       ),
            //       Expanded(child: SizedBox()),
            //       Padding(
            //         padding: const EdgeInsets.only(left: 30.0),
            //         child: Text("Profile"),
            //       ),
            //       Expanded(child: Container()),
            //       Search_UI(),
            //       Notification_UI(),
            //     ]),
            //   ),
            // ),
            controller.clubapp("Profile", Animals_Profiles_UI(), context),
            Stack(children: [
              Container(
                decoration: BoxDecoration(
                    color: animagiee_CL,
                    image: DecorationImage(
                        image: AssetImage(
                          "images/groupphoto.jpg",
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0.sp),
                        bottomRight: Radius.circular(15.0.sp))),
                width: MediaQuery.of(context).size.width,
                height: 13.0.hp,
                // 108,
                // child: Image.asset("images/groupphoto.jpg", fit: BoxFit.cover),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0.sp),
                        bottomRight: Radius.circular(15.0.sp))),
                width: MediaQuery.of(context).size.width,
                height: 13.0.hp,
                // 108,
                // child: Image.asset("images/groupphoto.jpg", fit: BoxFit.cover),
              ),
              Padding(
                padding: EdgeInsets.only(top: 35.0.sp, left: 20.0.sp),
                child: Align(
                  heightFactor: 1.4,
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    radius: 42.0.sp,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundImage:
                          ExactAssetImage("images/profilephotos.jpg"),
                      // backgroundColor: animagiee_CL,
                      radius: 40.0.sp,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(55.0.sp),
                child: Container(
                    margin: EdgeInsets.only(left: 50.0.sp),
                    child: Text(
                      "Karthi",
                      style: GoogleFonts.jost(
                        textStyle: TextStyle(
                          fontSize: 19.0.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 47.0.sp, right: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  heightFactor: 5,
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Text("1,22 Member"),
                        GestureDetector(
                          onTap: () {
                            // print(controller.communitylist.length);
                            Get.to(Chatting_Screen_UI());
                          },
                          child: Container(
                            height: 3.0.hp,
                            // 26,
                            width: 25.0.wp,
                            // 90,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: animagiee_CL,
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              "Message",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 9.0.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur.",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 9.0.sp,
                    color: dummycontent_Cl,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.4.hp,
              //  20,
            ),
            Container(
              height: 3.8.hp, //  30,
              // color: Colors.green,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Followers_UI(), Following_UI(), Setting_UI()]),
            ),
            SizedBox(
              height: 4.1.hp,
              // 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        pageController.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      });
                    },
                    child: Text(
                      "Post",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 10.0.sp,
                          color: dummycontent_Cl,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      "Communities",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 10.0.sp,
                          color: dummycontent_Cl,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                    height: pagechange == 0 ? 4 : 2,
                    width: 50.0.wp,
                    //  180,
                    color: animagiee_CL),
                Container(
                  height: pagechange == 1 ? 4 : 2,
                  width: 50.0.wp,
                  color: animagiee_CL,
                ),
              ],
            ),
            // Divider(color: animagiee_CL, thickness: 2),
            SizedBox(
              height: 2.0.hp,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 405,
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    pagechange = value;
                  });
                },
                children: [UserProfile_Page1_UI(), UserPage_Communitie_Page2()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
