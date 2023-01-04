import 'dart:math';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/instancepage/controller/userprofie_viewController.dart';
import 'package:animagieeui/view/instancepage/controller/userprofile_getpost.dart';
import 'package:animagieeui/view/userprofile/view/page2communitie.dart';

import 'package:animagieeui/view/userprofile/view/userprofdiscription.dart';
import 'package:animagieeui/view/userprofile/view/userprofileimage.dart';
import 'package:animagieeui/view/userprofile/view/userprofilename.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';
import '../../animagieeprofile/view/animalsprofiles.dart';

import '../../homeAppBar/view/notification.dart';
import '../../homeAppBar/view/search.dart';
import 'followers.dart';
import 'following.dart';
import 'messagebutton.dart';

import 'page1userpost.dart';
// import '../page2communitie.dart';
import 'profilebackgroundimage.dart';
import 'settings.dart';

class User_Profile extends StatefulWidget {
  String id;
  User_Profile({required this.id});

  @override
  State<User_Profile> createState() => _User_ProfileState();
}

class _User_ProfileState extends State<User_Profile> {
  double get randHeight => Random().nextInt(100).toDouble();
  Controller controller = Get.put(Controller());
  List<Widget> _randomChildren = [];
  UserPostProfileController userPostProfileController =
      Get.put(UserPostProfileController());
  UserPostGetProfilePostController userPostProfilePostController =
      Get.put(UserPostGetProfilePostController());
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
          const Profile_BG_Image_UI(),
          Container(
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0.sp),
                    bottomRight: Radius.circular(15.0.sp))),
            width: MediaQuery.of(context).size.width,
            height: 16.0.hp,
            // 108,
            // child: Image.asset("images/groupphoto.jpg", fit: BoxFit.cover),
          ),
          const User_Profile_Image_UI(),
          User_Profile_Name_UI(),
          Message_Button_UI(
            userId: widget.id,
          )
        ]),
        const User_Profile_Discription_UI(),
        SizedBox(
          height: 2.4.hp,
          //  20,
        ),
        SizedBox(
          height: 3.8.hp, //  30,
          // color: Colors.green,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Followers_UI(
              id: widget.id,
            ),
            Following_UI(id: widget.id),
            const Setting_UI()
          ]),
        ),
      ]);
    });

    return _randomChildren;
  }

  @override
  void initState() {
    userPostProfileController.userProfile(widget.id);
    super.initState();
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
          const Notification_UI(),
          SizedBox(
            width: 4.0.wp,
          )
        ],
        leading: IconButton(
            icon:
                Icon(Icons.arrow_back_ios, size: 12.0.sp, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
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
      body: Obx(() {
        if (userPostProfileController.userprofilescreenloadingindicator.value ==
            true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (userPostProfileController.data.isEmpty) {
          return const Center(child: Text("No result found"));
        } else {
          return DefaultTabController(
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
                    indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(width: 3.0, color: animagiee_CL),
                        insets: EdgeInsets.only(left: 5.0, right: 5.0)),
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
                        UserProfile_Page1_UI(id: widget.id),
                        UserPage_Communitie_Page2(
                          id: widget.id,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
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
