import 'dart:math';

import 'package:animagieeui/config/extension.dart';

import 'package:animagieeui/view/userprofile/userprofdiscription.dart';
import 'package:animagieeui/view/userprofile/userprofileimage.dart';
import 'package:animagieeui/view/userprofile/userprofilename.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';
import '../animagieeprofile/animalsprofiles.dart';

import '../homeAppBar/notification.dart';
import '../homeAppBar/search.dart';
import 'followers.dart';
import 'following.dart';
import 'messagebutton.dart';

import 'page1userpost.dart';
import 'page2communitie.dart';
import 'pageview.dart';
import 'profilebackgroundimage.dart';
import 'settings.dart';

class User_Profile extends StatefulWidget {
  User_Profile({Key? key}) : super(key: key);

  @override
  State<User_Profile> createState() => _User_ProfileState();
}

class _User_ProfileState extends State<User_Profile> {
  double get randHeight => Random().nextInt(100).toDouble();
  Controller controller = Get.put(Controller());
  List<Widget> _randomChildren = [];

  // Children with random heights - You can build your widgets of unknown heights here
  // I'm just passing the context in case if any widgets built here needs  access to context based data like Theme or MediaQuery
  List<Widget> _randomHeightWidgets(BuildContext context) {
    _randomChildren = List.generate(1, (index) {
      final height = randHeight.clamp(
        50.0,
        MediaQuery.of(context)
            .size
            .width, // simply using MediaQuery to demonstrate usage of context
      );
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // controller.clubapp("Profile", Animals_Profiles_UI(), context),
        Stack(children: [
          Profile_BG_Image_UI(),
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
          User_Profile_Image_UI(),
          User_Profile_Name_UI(),
          Message_Button_UI()
        ]),
        User_Profile_Discription_UI(),
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
      ]);
    });

    return _randomChildren;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Persistent AppBar that never scrolls
      appBar: AppBar(
        actions: [
          Search_UI(),
          SizedBox(
            width: 3.0.wp,
          ),
          Notification_UI(),
          SizedBox(
            width: 4.0.wp,
          )
        ],
        leading: IconButton(
            icon:
                Icon(Icons.arrow_back_ios, size: 12.0.sp, color: Colors.black),
            onPressed: () {
              Get.to(Animals_Profiles_UI());
            }),
        backgroundColor: Colors.white,
        toolbarHeight: 7.0.hp,
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 10.5.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        elevation: 3.0,
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          // allows you to build a list of elements that would be scrolled away till the body reached the top
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  _randomHeightWidgets(context),
                ),
              ),
            ];
          },
          // You tab view goes here
          body: Column(
            children: <Widget>[
              TabBar(
                indicatorColor: animagiee_CL,
                // labelColor: animagiee_CL,
                tabs: [
                  Tab(
                      child: Text(
                    'Post',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 9.0.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
                  Tab(
                      child: Text(
                    'Communities',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 9.0.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ))
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    UserProfile_Page1_UI(),
                    UserPage_Communitie_Page2()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
// class _User_ProfileState extends State<User_Profile> {
//   Controller controller = Get.put(Controller());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             controller.clubapp("Profile", Animals_Profiles_UI(), context),
//             Stack(children: [
//               Profile_BG_Image_UI(),
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.black38,
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(15.0.sp),
//                         bottomRight: Radius.circular(15.0.sp))),
//                 width: MediaQuery.of(context).size.width,
//                 height: 13.0.hp,
//                 // 108,
//                 // child: Image.asset("images/groupphoto.jpg", fit: BoxFit.cover),
//               ),
//               User_Profile_Image_UI(),
//               User_Profile_Name_UI(),
//               Message_Button_UI()
//             ]),
//             User_Profile_Discription_UI(),
//             SizedBox(
//               height: 2.4.hp,
//               //  20,
//             ),
//             Container(
//               height: 3.8.hp, //  30,
//               // color: Colors.green,
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [Followers_UI(), Following_UI(), Setting_UI()]),
//             ),
//             SizedBox(
//               height: 4.1.hp,
//               // 30,
//             ),
//             PageView_Content_UI()
//           ],

//       ),
//     );
  }
}
