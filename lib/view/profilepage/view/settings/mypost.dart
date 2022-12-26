import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/colorconfig.dart';
import '../../../../controller/controller.dart';
import '../../../homeAppBar/view/appbar.dart';
import '../../../homepage/view/bookmark.dart';
import '../../../homepage/view/commend.dart';
import '../../../homepage/view/likes.dart';
import '../../../homepage/view/share.dart';

class My_Post_UI extends StatefulWidget {
  const My_Post_UI({Key? key}) : super(key: key);

  @override
  State<My_Post_UI> createState() => _My_Post_UIState();
}

class _My_Post_UIState extends State<My_Post_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          AppbarContainer(
            title: "My Profile",
            backarrow: true,
            chat: false,
            notification: true,
            search: true,
            logo: false,
            edit: false,
            searchfunction: true,
            searchfunctionclose: false,
            notification_back_arrow: false,
            firstscreen: false,
            navipage: null,
            podcast: false,
            fun: Home_Page(),
          ),

          // controller.clubapp("My Profile", Home_Page(), context),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 11.3.hp,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.Home_Post.length,
                itemBuilder: (context, index) => Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            backgroundImage:
                                ExactAssetImage(controller.Home_Post[index]),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "My Post $index",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 10.5.sp,
                                color: buttonColor1_CL,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          // GestureDetector(
                          //   onTap: () {
                          //     setState(() {
                          //       showModalBottomSheet(
                          //         context: context,
                          //         shape: RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.only(
                          //                 topLeft: Radius.circular(20),
                          //                 topRight: Radius.circular(20))),
                          //         builder: (context) {
                          //           return Container(
                          //             height: 174,
                          //             width: MediaQuery.of(context).size.width,
                          //             child: Column(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.spaceEvenly,
                          //               children: [
                          //                 Text(
                          //                   "Unfollow",
                          //                   style: GoogleFonts.poppins(
                          //                     textStyle: TextStyle(
                          //                       fontSize: 10.0.sp,
                          //                       color: club_Text_1,
                          //                       fontWeight: FontWeight.w500,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Divider(
                          //                   color: Colors.black,
                          //                   endIndent: 30,
                          //                   indent: 30,
                          //                   // height: 5,
                          //                 ),
                          //                 Text(
                          //                   "Report",
                          //                   style: GoogleFonts.poppins(
                          //                     textStyle: TextStyle(
                          //                       fontSize: 10.0.sp,
                          //                       color: club_Text_1,
                          //                       fontWeight: FontWeight.w500,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Divider(
                          //                   color: Colors.black,
                          //                   endIndent: 30,
                          //                   indent: 30,
                          //                   // height: 5,
                          //                 ),
                          //                 Text(
                          //                   "Block",
                          //                   style: GoogleFonts.poppins(
                          //                     textStyle: TextStyle(
                          //                       fontSize: 10.0.sp,
                          //                       color: club_Text_1,
                          //                       fontWeight: FontWeight.w500,
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           );
                          //         },
                          //       );
                          //     });
                          //   },
                          //   child: SizedBox(
                          //     height: 2.0.hp,
                          //     // 16,
                          //     width: 5.0.wp,
                          //     // 16,
                          //     child: Image.asset(
                          //       "images/burger.png",
                          //       // cacheHeight: 16,
                          //       // cacheWidth: 16,
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            width: 5,
                          )
                          // IconButton(
                          //   onPressed: () {

                          //   },
                          //   icon: Icon(Icons.menu),
                          // )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                          "Laoreet nunc morbi lectus donec.",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 9.5.sp,
                              color: dummycontent_Cl,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 45.0.hp,
                        //  346,

                        width: 95.0.wp,
                        // 346,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(controller.Home_Post[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "12 Likes",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 9.0.sp,
                                  color: TextContent1_CL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "12 Comments",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 9.0.sp,
                                  color: TextContent1_CL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              "100 Views",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 9.0.sp,
                                  color: TextContent1_CL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(children: [
                        Likes_UI(),
                        Comment_UI(),
                        Share_UI(),
                        Expanded(child: Container()),
                        BookMark_UI(),
                      ])
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
