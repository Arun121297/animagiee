import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';
import '../../homepage/bookmark.dart';
import '../../homepage/commend.dart';
import '../../homepage/likes.dart';
import '../../homepage/share.dart';
import '../myprofile.dart';

class My_Favourites_UI extends StatefulWidget {
  const My_Favourites_UI({Key? key}) : super(key: key);

  @override
  State<My_Favourites_UI> createState() => _My_Favourites_UIState();
}

class _My_Favourites_UIState extends State<My_Favourites_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          children: [
            controller.clubapp("My Favourites", Home_Page(), context),
            Expanded(
                child: SingleChildScrollView(
                    child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.Home_Post.length,
                itemBuilder: (context, index) => Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
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
                            "AdminName $index",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 12.0.sp,
                                color: buttonColor1_CL,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  builder: (context) {
                                    return Container(
                                      height: 174,
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "UnFollow",
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                fontSize: 10.0.sp,
                                                color: dummycontent_Cl,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                            endIndent: 10,
                                            indent: 10,
                                          ),
                                          Text(
                                            "Report",
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                fontSize: 10.0.sp,
                                                color: dummycontent_Cl,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                            endIndent: 10,
                                            indent: 10,
                                          ),
                                          Text(
                                            "Block",
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                fontSize: 10.0.sp,
                                                color: dummycontent_Cl,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              });
                            },
                            child: SizedBox(
                              height: 16,
                              width: 16,
                              child: Image.asset(
                                "images/burger.png",
                                // cacheHeight: 16,
                                // cacheWidth: 16,
                              ),
                            ),
                          ),
                          // IconButton(
                          //   onPressed: () {
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
                          //                   "UnFollow",
                          //                   style: GoogleFonts.poppins(
                          //                     textStyle: TextStyle(
                          //                       fontSize: 10.0.sp,
                          //                       color: dummycontent_Cl,
                          //                       fontWeight: FontWeight.w500,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Divider(
                          //                   color: Colors.grey,
                          //                   endIndent: 10,
                          //                   indent: 10,
                          //                 ),
                          //                 Text(
                          //                   "Report",
                          //                   style: GoogleFonts.poppins(
                          //                     textStyle: TextStyle(
                          //                       fontSize: 10.0.sp,
                          //                       color: dummycontent_Cl,
                          //                       fontWeight: FontWeight.w500,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Divider(
                          //                   color: Colors.grey,
                          //                   endIndent: 10,
                          //                   indent: 10,
                          //                 ),
                          //                 Text(
                          //                   "Block",
                          //                   style: GoogleFonts.poppins(
                          //                     textStyle: TextStyle(
                          //                       fontSize: 10.0.sp,
                          //                       color: dummycontent_Cl,
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
                          //   icon: Icon(Icons.menu),
                          // )
                          SizedBox(
                            width: 8,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                          "Laoreet nunc morbi lectus donec.",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 10.0.sp,
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
                        height: 40.0.hp,
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
                              "12 Like",
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
                              "100 View",
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
                        // Container(
                        //   width: 125,
                        //   // color: Colors.orange,
                        //   // height: 20,
                        //   child:
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [
                        Likes_UI(),
                        SizedBox(
                          width: 5,
                        ),
                        Comment_UI(),
                        Share_UI(),
                        //   ],
                        // ),
                        // ),
                        // Expanded(child: Container()),
                        Expanded(child: Container()),
                        BookMark_UI(),
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            )))
          ],
        ),
      ),
    ));
  }
}
