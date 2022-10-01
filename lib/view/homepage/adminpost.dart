import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/doctor/doctorprofiless/header.dart';
import 'package:animagieeui/view/homepage/share.dart';
import 'package:animagieeui/view/homepage/suggestion.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';
import '../animagieeprofile/animalsprofiles.dart';
import '../userprofile/userprofile.dart';
import 'bookmark.dart';
import 'commend.dart';
import 'likes.dart';
import 'share.dart';

class Admin_Post extends StatefulWidget {
  const Admin_Post({Key? key}) : super(key: key);

  @override
  State<Admin_Post> createState() => _Admin_PostState();
}

class _Admin_PostState extends State<Admin_Post> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 210,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: controller.Home_Post.length,
        itemBuilder: (context, index) => Column(
          children: [
            Card(
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
                      GestureDetector(
                        onTap: () {
                          Get.to(User_Profile());
                        },
                        child: CircleAvatar(
                          backgroundImage:
                              ExactAssetImage(controller.Home_Post[index]),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(User_Profile());
                        },
                        child: SizedBox(
                          width: 70.0.wp,
                          // color: Colors.amber,
                          child: Text(
                            "AdminName $index",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 11.5.sp,
                                color: buttonColor1_CL,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            popup();
                          });
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
                        width: 8,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0.sp),
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
                    height: 1.0.hp,
                    //  12,
                  ),
                  Container(
                    height: 45.0.hp,
                    //  346,
                    width: 95.0.wp,
                    // 346,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0.sp),
                      image: DecorationImage(
                        image: AssetImage(controller.Home_Post[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0.sp),
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
                    SizedBox(
                      width: 2.0.wp,
                    ),
                    Comment_UI(),
                    SizedBox(
                      width: 1.8.wp,
                    ),
                    Share_UI(),
                    Expanded(child: Container()),
                    BookMark_UI(),
                  ]),
                  SizedBox(height: 2.0.sp
                      //  10,
                      ),
                ],
              ),
            ),
            Visibility(
                visible: index == 3 ? true : false,
                child: Suggested_For_You_UI()),
          ],
        ),
      ),
    );
  }

  popup() {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return Container(
          height: 20.0.hp,
          //  174,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Unfollow",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.0.sp,
                    color: club_Text_1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
                endIndent: 30,
                indent: 30,
                // height: 5,
              ),
              Text(
                "Report",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.0.sp,
                    color: club_Text_1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
                endIndent: 30,
                indent: 30,
                // height: 5,
              ),
              Text(
                "Block",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.0.sp,
                    color: club_Text_1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
