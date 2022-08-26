import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/userprofile/page1userpost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.cusapp("Profile", context),
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
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                width: MediaQuery.of(context).size.width,
                height: 14.0.hp,
                // 108,
                // child: Image.asset("images/groupphoto.jpg", fit: BoxFit.cover),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.0, left: 20),
                child: Align(
                  heightFactor: 1.4,
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    radius: 36.0.sp,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundImage:
                          ExactAssetImage("images/profilephotos.jpg"),
                      // backgroundColor: animagiee_CL,
                      radius: 34.0.sp,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(70.0),
                child: Container(
                    margin: EdgeInsets.only(left: 50),
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
                padding: const EdgeInsets.only(top: 120.0, right: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  // heightFactor: 2,
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Text("1,22 Member"),
                        GestureDetector(
                          onTap: () {
                            print(controller.communitylist.length);
                          },
                          child: Container(
                            height: 3.5.hp,
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
                    child: Text("Post")),
                GestureDetector(
                    onTap: () {
                      pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text("Communities"))
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
              height: MediaQuery.of(context).size.height - 390,
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
