import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/config/size_config.dart';
import 'package:animagieeui/view/home.dart';
import 'package:animagieeui/view/homepage/view/followRequestGet.dart';
import 'package:animagieeui/view/homepage/view/myFollowUser.dart';
import 'package:animagieeui/view/homepage/view/myFollower.dart';
import 'package:animagieeui/view/instancepage/controller/instancecontroller.dart';
import 'package:animagieeui/view/profilepage/controller/profilecontroller.dart';
import 'package:animagieeui/view/profilepage/view/settings/mycommunities.dart';
import 'package:animagieeui/view/profilepage/view/settings/settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';
import 'MyFavourites/views/myfav.dart';
import 'settings/mypost.dart';

class MY_Profile_Header_UI extends StatefulWidget {
  const MY_Profile_Header_UI({Key? key}) : super(key: key);

  @override
  State<MY_Profile_Header_UI> createState() => _MY_Profile_Header_UIState();
}

class _MY_Profile_Header_UIState extends State<MY_Profile_Header_UI> {
  ProfileController profileController = Get.put(ProfileController());

  InstanceContoroller instanceContoroller = Get.put(InstanceContoroller());
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var data = profileController.profileData[0].data;
    // return
    // Obx(() {
    //   if (profileController.profileloadingindecator.value) {
    //     return Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   } else {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            // color: Colors.black,
            height: 21.0.hp,
            //  168,
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                    // color:
                    //     controller.profileglobalbackgroundimage.path.isEmpty
                    //         ? animagiee_CL
                    //         : Colors.transparent,
                    image: data!.profilebackimg!.isEmpty
                        ? const DecorationImage(
                            image: AssetImage("images/profile_icon.png"),
                            fit: BoxFit.cover)
                        : DecorationImage(
                            image: NetworkImage(data.profilebackimg.toString()),
                            fit: BoxFit.cover),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                width: MediaQuery.of(context).size.width,
                height: 14.0.hp,

                //  108,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                width: MediaQuery.of(context).size.width,
                height: 14.0.hp,
                //  108,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0.sp, left: 15.0.sp),
                child: Align(
                  heightFactor: 1.4,
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    radius: 42.0.sp,
                    backgroundColor: Colors.white,
                    child: data.profileicon!.isEmpty
                        ?
                        // controller.pFglobalprofileimage.path.isEmpty
                        CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: const ExactAssetImage(
                                "images/profile_icon.png"),
                            // backgroundColor: animagiee_CL,
                            radius: 40.0.sp,
                          )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(
                              data.profileicon.toString(),
                            ),
                            // backgroundColor: animagiee_CL,
                            radius: 40.0.sp,
                          ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(48.0.sp),
                child: Container(
                    padding: EdgeInsets.only(left: 30.0.sp, top: 6.0.sp),
                    margin: EdgeInsets.only(left: 30.0.sp),
                    child: Text(
                      data.firstName!.isEmpty
                          ? data.username.toString()
                          : data.firstName.toString(),
                      style: GoogleFonts.jost(
                        textStyle: TextStyle(
                          fontSize: 19.5.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              data.about.toString(),
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 9.5.sp,
                  color: dummycontent_Cl,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 3.0.hp
              // 15,
              ),
          Padding(
            padding: EdgeInsets.only(left: 5.0.wp, right: 5.0.wp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(
                //   width: 5.5.wp,
                // ),
                InkWell(
                  onTap: () {
                    Get.to(const MyFollower());
                  },
                  child: Container(
                    height: 4.7.hp,
                    // 30,
                    // width: 33.0.wp,
                    width: 41.5.wp,
                    // 124,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: animagiee_CL,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Followers",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 11.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const VerticalDivider(
                          color: animagiee_CL,
                        ),
                        Text(
                          data.followerUser!.length.toString(),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 11.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   width: 3.3.wp,
                // ),
                InkWell(
                  onTap: () {
                    Get.to(const MyFollowUser());
                  },
                  child: Container(
                    height: 4.7.hp,
                    // 30,
                    // width: 33.0.wp,
                    width: 41.5.wp,
                    // 124,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: animagiee_CL,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Following",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 11.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const VerticalDivider(
                          color: animagiee_CL,
                        ),
                        Text(
                          data.followingUser!.length.toString(),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 11.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.0.hp,
            // 15,
          ),
          // SizedBox(
          //   width: MediaQuery.of(context).size.width,
          // child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => My_Post_UI(
                        id: data.id,
                      ));
                },
                child: Card(
                  elevation: 3,
                  child: SizedBox(
                      width: 47.8.wp,
                      // 160,
                      height: 5.5.hp,
                      // 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 3.0.hp,
                            width: 7.0.wp,
                            child: Image.asset(
                              "images/profileframe.png",
                            ),
                          ),
                          // Icon(
                          //   Icons.image_outlined,
                          //   color: animagiee_CL,
                          // ),
                          Text(
                            "Post",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 10.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const VerticalDivider(
                            endIndent: 5,
                            indent: 5,
                            color: Colors.grey,
                            thickness: 1,
                            width: 2,
                          ),
                          Text(
                            profileController.profileData[0].postCount
                                .toString(),
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 10.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const My_Communities_UI());
                },
                child: Card(
                  elevation: 3,
                  child: SizedBox(
                      width: 47.7.wp,
                      // 160,
                      height: 5.5.hp,
                      // 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 3.0.hp,
                            width: 7.0.wp,
                            child: Image.asset(
                              "images/grouplogo.png",
                            ),
                          ),
                          Text(
                            "Community",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 10.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const VerticalDivider(
                            endIndent: 5,
                            indent: 5,
                            color: Colors.grey,
                            thickness: 1,
                            width: 2,
                          ),
                          Text(
                            profileController.profileData[0].communityCount
                                .toString(),
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 10.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
          // ),
          SizedBox(height: 3.0.hp
              // 25,
              ),
          Container(
            alignment: Alignment.center,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const My_Favourites_UI());
                  },
                  child: Container(
                    height: 6.0.hp,
                    // 46,
                    width: 90.0.wp,
                    decoration: BoxDecoration(
                        color: boxcolor_CL,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: Colors.grey)),
                    // 330,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0.wp),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.bookmark,
                            color: animagiee_CL,
                          ),
                          SizedBox(
                            width: 5.0.wp,
                          ),
                          Container(
                            alignment: Alignment.center,
                            // color: Colors.green,
                            width: 25.0.wp,
                            //  95,
                            child: Text(
                              "My Favourites",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 11.0.sp,
                                  color: Settings_Text_CL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 3.0.hp),
                GestureDetector(
                  onTap: () {
                    Get.to(const FollowRequestGet());
                  },
                  child: Container(
                    height: 6.0.hp,
                    // 46,
                    width: 90.0.wp,
                    decoration: BoxDecoration(
                        color: boxcolor_CL,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: Colors.grey)),
                    // 330,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.0.wp,
                        ),
                        SizedBox(
                          height: 3.0.hp,
                          //  18,
                          width: 6.0.wp,
                          //  18,
                          child: Image.asset(
                            "images/follow.png",
                            // cacheHeight: 12,
                            // width: 17,
                          ),
                        ),
                        SizedBox(
                          width: 7.0.wp,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 27.0.wp,
                          //  95,
                          child: Text(
                            "Follow Requests",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 11.0.sp,
                                color: Settings_Text_CL,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        // VerticalDivider(
                        //   color: Colors.transparent,
                        // ),
                      ],
                    ),
                  ),
                ),
                // Visibility(
                //     visible: controller.profilechangebool.value == true &&
                //             controller.appoinmentdetailshide.value == false
                //         ? true
                //         : false,
                //     child: SizedBox(height: 3.0.hp)),
                // Visibility(
                //   visible: controller.profilechangebool.value,
                //   child: GestureDetector(
                //     onTap: () {
                //       Get.to(const My_Work_Design_UI());
                //       // Get.to(Scaffold(
                //       //   body:
                //       //   // About_Design_UI(),
                //       // ));
                //     },
                //     child: Container(
                //       height: 6.0.hp,
                //       // 46,
                //       width: 90.0.wp,
                //       decoration: BoxDecoration(
                //           color: boxcolor_CL,
                //           borderRadius: BorderRadius.circular(5),
                //           border: Border.all(width: 1, color: Colors.grey)),
                //       // 330,
                //       child: Row(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         children: [
                //           Container(
                //             width: 95,
                //             alignment: Alignment.center,
                //             // color: Colors.green,
                //             child: Text(
                //               "My Work",
                //               style: GoogleFonts.poppins(
                //                 textStyle: TextStyle(
                //                   fontSize: 9.5.sp,
                //                   color: Settings_Text_CL,
                //                   fontWeight: FontWeight.w500,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           // SizedBox(
                //           //   width: 2,
                //           // ),
                //           SizedBox(
                //             height: 3.0.hp,
                //             //  18,
                //             width: 6.0.wp,
                //             //  18,
                //             child: Image.asset(
                //               "images/profilecart.png",
                //               // cacheHeight: 18,
                //               // cacheWidth: 18,
                //               color: animagiee_CL,
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 3.0.hp),
                // Visibility(
                //   visible: controller.profilechangebool.value,
                //   child: GestureDetector(
                //     onTap: () {
                //       Get.to(const Scaffold(
                //         body: About_Design_UI(),
                //       ));
                //     },
                //     child: Container(
                //       height: 6.0.hp,
                //       // 46,
                //       width: 90.0.wp,
                //       decoration: BoxDecoration(
                //           color: boxcolor_CL,
                //           borderRadius: BorderRadius.circular(5),
                //           border: Border.all(width: 1, color: Colors.grey)),
                //       // 330,
                //       child: Row(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         children: [
                //           Container(
                //             width: 95,
                //             // color: Colors.green,
                //             alignment: Alignment.center,
                //             child: Text(
                //               "About",
                //               style: GoogleFonts.poppins(
                //                 textStyle: TextStyle(
                //                   fontSize: 9.5.sp,
                //                   color: Settings_Text_CL,
                //                   fontWeight: FontWeight.w500,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           // SizedBox(
                //           //   width: 2,
                //           // ),
                //           SizedBox(
                //             height: 3.0.hp,
                //             // 18,
                //             width: 6.0.wp,
                //             // 18,
                //             child: Image.asset(
                //               "images/about.png",
                //               // cacheHeight: 18,
                //               // cacheWidth: 18,
                //               color: animagiee_CL,
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Visibility(
                //   visible: controller.appoinmentdetailshide.value,
                //   child: GestureDetector(
                //     onTap: () {
                //       Get.to(const AppoinmentDetails_UI());
                //     },
                //     child: Container(
                //       height: 6.0.hp,
                //       // 46,
                //       width: 90.0.wp,
                //       decoration: BoxDecoration(
                //           color: boxcolor_CL,
                //           borderRadius: BorderRadius.circular(5),
                //           border: Border.all(width: 1, color: Colors.grey)),
                //       // 330,
                //       child: Row(
                //         children: [
                //           SizedBox(
                //             width: 10.0.wp,
                //           ),
                //           SizedBox(
                //             height: 3.0.hp,
                //             //  18,
                //             width: 6.0.wp,
                //             //  18,
                //             child: Image.asset(
                //               "images/profilecart.png",
                //               // cacheHeight: 12,
                //               // width: 17,
                //             ),
                //           ),
                //           SizedBox(
                //             width: 8.0.wp,
                //           ),
                //           SizedBox(
                //             width: 39.0.wp,
                //             child: Text(
                //               "Appointment Details",
                //               style: GoogleFonts.poppins(
                //                 textStyle: TextStyle(
                //                   fontSize: 9.5.sp,
                //                   color: Settings_Text_CL,
                //                   fontWeight: FontWeight.w500,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           // Flexible(child: SizedBox()),

                //           const VerticalDivider()
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: 3.0.hp),
                GestureDetector(
                  onTap: () {
                    Get.to(const Settings_Page_1_UI());
                  },
                  child: Container(
                    height: 6.0.hp,
                    // 46,
                    width: 90.0.wp,
                    decoration: BoxDecoration(
                        color: boxcolor_CL,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: Colors.grey)),
                    // 330,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0.wp),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.settings,
                            color: animagiee_CL,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 27.0.wp,
                            //  95,
                            child: Text(
                              "Settings",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 11.0.sp,
                                  color: Settings_Text_CL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          // VerticalDivider(
                          //   color: Colors.transparent,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 3.0.hp),
                GestureDetector(
                  onTap: () => logout(),
                  child: Container(
                    height: 6.0.hp,
                    // 46,
                    width: 90.0.wp,
                    decoration: BoxDecoration(
                        color: boxcolor_CL,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: Colors.grey)),
                    // 330,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0.wp),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.logout,
                            color: animagiee_CL,
                          ),

                          Container(
                            alignment: Alignment.center,
                            // color: Colors.orange,
                            width: 28.0.wp,
                            //  95,
                            child: Text(
                              "Logout",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 11.0.sp,
                                  color: Settings_Text_CL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0.hp,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
  // });
  // }

  logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear().then((value) {
      // Get.back();
      Get.deleteAll();

      // Get.offNamed('/login');
    });

    await Firebase.initializeApp();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    Get.to(SecondScreen());
  }
}
