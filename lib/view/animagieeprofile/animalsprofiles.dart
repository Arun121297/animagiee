import 'dart:math';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/animagieeprofile/post.dart';
import 'package:animagieeui/view/homeAppBar/notification.dart';
import 'package:animagieeui/view/homeAppBar/search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';

import '../communitypage/clubs/myclubs.dart';

import 'member.dart';

// class Animals_Profiles_UI extends StatefulWidget {
//   const Animals_Profiles_UI({Key? key}) : super(key: key);

//   @override
//   State<Animals_Profiles_UI> createState() => _Animals_Profiles_UIState();
// }
class Animals_Profiles_UI extends StatefulWidget {
  @override
  _Animals_Profiles_UIState createState() => _Animals_Profiles_UIState();
}

class _Animals_Profiles_UIState extends State<Animals_Profiles_UI> {
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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "1,22 Members",
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
        ],
      );
    });

    return _randomChildren;
  }

  back() async {
    await Get.to(MyClubs_UI());
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
              Get.to(MyClubs_UI());
            }),
        backgroundColor: Colors.white,
        toolbarHeight: 7.0.hp,
        centerTitle: true,
        title: Text(
          'Dogs FC',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 10.5.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        elevation: 3,
      ),
      body: WillPopScope(
        onWillPop: () {
          return back();
        },
        child: DefaultTabController(
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
                      'Member',
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
                    children: [Pageview1_Post(), Pageview2_Member()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class _Animals_Profiles_UIState extends State<Animals_Profiles_UI> {
//   PageController pageController = PageController();
//   Controller controller = Get.put(Controller());
//   var pagechange;
//   @override
//   void initState() {
//     pagechange = 0;
//     // TODO: implement initState
//     super.initState();
//   }
// // TabController tabController = TabController(length: 2, vsync: this)
//   // List pages = [Pageview1_Post(), Pageview2_Member()];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             controller.clubapp("Dogs FC", MyClubs_UI(), context),
//             //Content ----- 1
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 22.0.hp,
//                   //  168,
//                   child: Stack(children: [
//                     Container(
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage("images/Dogs.jpg"),
//                               fit: BoxFit.cover),
//                           color: animagiee_CL,
//                           borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(15.0.sp),
//                               bottomRight: Radius.circular(15.0.sp))),
//                       width: MediaQuery.of(context).size.width,
//                       height: 13.0.hp,
//                       // 108,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           color: Colors.black38,
//                           borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(15.0.sp),
//                               bottomRight: Radius.circular(15.0.sp))),
//                       width: MediaQuery.of(context).size.width,
//                       height: 13.0.hp,
//                       // 108,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: 40.0.sp, left: 20.0.sp),
//                       child: Align(
//                         heightFactor: 1.4,
//                         alignment: Alignment.centerLeft,
//                         child: CircleAvatar(
//                           radius: 42.0.sp,
//                           backgroundColor: Colors.white,
//                           child: CircleAvatar(
//                             backgroundImage: ExactAssetImage("images/Dogs.jpg"),
//                             radius: 40.0.sp,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(50.0.sp),
//                       child: Container(
//                           margin: EdgeInsets.only(left: 58.0.sp),
//                           child: Text(
//                             "DOGS FC",
//                             style: GoogleFonts.jost(
//                               textStyle: TextStyle(
//                                 fontSize: 19.5.sp,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           )),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: 100.0.sp, right: 10.0.sp),
//                       child: Align(
//                         alignment: Alignment.bottomRight,
//                         child: SizedBox(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Text(
//                                 "1,22 Members",
//                                 style: GoogleFonts.poppins(
//                                   textStyle: TextStyle(
//                                     fontSize: 8.0.sp,
//                                     color: dummycontent_Cl,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   print(controller.communitylist.length);
//                                 },
//                                 child: Container(
//                                   height: 3.0.hp,
//                                   // 26,
//                                   width: 23.0.wp,
//                                   // 90,
//                                   alignment: Alignment.center,
//                                   decoration: BoxDecoration(
//                                       color: animagiee_CL,
//                                       borderRadius:
//                                           BorderRadius.circular(15.0.sp)),
//                                   child: Text(
//                                     "Joined",
//                                     style: GoogleFonts.poppins(
//                                       textStyle: TextStyle(
//                                         fontSize: 9.0.sp,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                   ]),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(10.0.sp),
//                   child: Text(
//                     "Lorem ipsum dolor sit amet, consectetur.",
//                     style: GoogleFonts.poppins(
//                       textStyle: TextStyle(
//                         fontSize: 10.0.sp,
//                         color: dummycontent_Cl,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             //Content ----- 2
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           pageController.animateToPage(
//                             0,
//                             duration: const Duration(milliseconds: 400),
//                             curve: Curves.easeInOut,
//                           );
//                         });
//                       },
//                       child: Text(
//                         "Post",
//                         style: GoogleFonts.poppins(
//                           textStyle: TextStyle(
//                             fontSize: 9.0.sp,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       )),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       pageController.animateToPage(
//                         1,
//                         duration: const Duration(milliseconds: 400),
//                         curve: Curves.easeInOut,
//                       );
//                     });
//                   },
//                   child: Container(
//                     child: Text(
//                       "Members",
//                       style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                           fontSize: 9.0.sp,
//                           color: Colors.black,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               children: [
//                 Container(
//                     height: pagechange == 0 ? 4 : 2,
//                     width: 50.0.wp,
//                     //  180,
//                     color: animagiee_CL),
//                 Container(
//                   height: pagechange == 1 ? 4 : 2,
//                   width: 50.0.wp,
//                   color: animagiee_CL,
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 1.5.hp,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height - 330,
//               child:
//                   //  ListView.builder(
//                   //   itemCount: pages.length,
//                   //   shrinkWrap: true,
//                   //   scrollDirection: Axis.horizontal,
//                   //   reverse: false,
//                   //   itemBuilder: (context, index) {
//                   //     return SizedBox(
//                   //       child: pages[index],
//                   //     );
//                   //   },
//                   // )
//                   PageView(
//                 controller: pageController,
//                 onPageChanged: (value) {
//                   setState(() {
//                     pagechange = value;
//                   });
//                 },
//                 children: [Pageview1_Post(), Pageview2_Member()],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
