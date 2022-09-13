import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/animagieeprofile/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';
import '../communitypage/clubs/createnewclub.dart';
import '../communitypage/clubs/myclubs.dart';

import '../homeAppBar/notification.dart';
import '../homeAppBar/search.dart';
import 'member.dart';

class Animals_Profiles_UI extends StatefulWidget {
  const Animals_Profiles_UI({Key? key}) : super(key: key);

  @override
  State<Animals_Profiles_UI> createState() => _Animals_Profiles_UIState();
}

class _Animals_Profiles_UIState extends State<Animals_Profiles_UI> {
  PageController pageController = PageController();
  Controller controller = Get.put(Controller());
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
            // Create_New_Club_UI
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
            //           // Get.to(Create_New_Club_UI());
            //           Get.to(MyClubs_UI());
            //         },
            //       ),
            //       Expanded(child: SizedBox()),
            //       Padding(
            //         padding: const EdgeInsets.only(left: 30.0),
            //         child: Text("Dogs FC"),
            //       ),
            //       Expanded(child: Container()),
            //       Search_UI(),
            //       Notification_UI(),
            //     ]),
            //   ),
            // ),
            controller.clubapp("Dogs FC", MyClubs_UI(), context),
            Container(
              // color: Colors.black,
              height: 22.0.hp,
              //  168,
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/Dogs.jpg"),
                          fit: BoxFit.cover),
                      color: animagiee_CL,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15.0.sp),
                          bottomRight: Radius.circular(15.0.sp))),
                  width: MediaQuery.of(context).size.width,
                  height: 13.0.hp,
                  // 108,
                  // child: Image.asset("images/Dogs.jpg", fit: BoxFit.cover),
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
                  // child: Image.asset("images/Dogs.jpg", fit: BoxFit.cover),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.0.sp, left: 20.0.sp),
                  child: Align(
                    heightFactor: 1.4,
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      radius: 42.0.sp,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundImage: ExactAssetImage("images/Dogs.jpg"),
                        // backgroundColor: animagiee_CL,
                        radius: 40.0.sp,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(50.0.sp),
                  child: Container(
                      margin: EdgeInsets.only(left: 58.0.sp),
                      child: Text(
                        "DOGS FC",
                        style: GoogleFonts.jost(
                          textStyle: TextStyle(
                            fontSize: 19.5.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100.0.sp, right: 10.0.sp),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    // heightFactor: 2,
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "1,22 Member",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 8.0.sp,
                                color: dummycontent_Cl,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print(controller.communitylist.length);
                            },
                            child: Container(
                              height: 3.0.hp,
                              // 26,
                              width: 23.0.wp,
                              // 90,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: animagiee_CL,
                                  borderRadius: BorderRadius.circular(15.0.sp)),
                              child: Text(
                                "Joined",
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
            ),
            Padding(
              padding: EdgeInsets.all(10.0.sp),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur.",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.0.sp,
                    color: dummycontent_Cl,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: GestureDetector(
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
                            fontSize: 9.0.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    });
                  },
                  child: Container(
                    child: Text(
                      "Members",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 9.0.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
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
              height: 1.5.hp,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 330,
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    pagechange = value;
                  });
                },
                children: [Pageview1_Post(), Pageview2_Member()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
