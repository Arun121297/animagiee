import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/data/pages.dart';
import 'package:animagieeui/view/homepage/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';
import '../../homeAppBar/view/appbar.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar:
      body: SafeArea(
        child: Column(
          children: [
            AppbarContainer(
              title: "Create Post",
              backarrow: true,
              firstscreen: false,
              navipage: null,
              notification: true,
              searchfunction: true,
              searchfunctionclose: false,
              edit: false,
              notification_back_arrow: false,
              search: true,
              chat: false,
              logo: false,
              podcast: false,
              fun: Home_Page(),
            ),

            // controller.chatapp("Create Post", Home_Page(), context),
            SizedBox(
              height: 19,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: ExactAssetImage("images/Exotic_Birds.jpg"),
                    radius: 30.0.sp,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Karthi",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 12.0.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      Get.to(Home_Page());
                    },
                    child: Container(
                      // margin: EdgeInsets.only(top: 30),
                      alignment: Alignment.center,
                      width: 22.0.wp,
                      //  80,
                      height: 4.5.hp,
                      // 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        color: animagiee_CL,
                      ),
                      child: Text(
                        "Post",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 11.0.sp,
                            color: skip_CL,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 5.0.hp
                // 42,
                ),
            Container(
              height: 47.0.hp,
              //  354,
              width: 350,
              // MediaQuery.of(context).size.width,
              // color: Colors.orange,
              margin: EdgeInsets.only(left: 5.0.sp),
              child: TextField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration.collapsed(
                    hintStyle: GoogleFonts.jost(
                      textStyle: TextStyle(
                        fontSize: 18.5.sp,
                        color: text_1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    hintText: 'What’s on your mind ?'),
              ),
            ),
            Expanded(
                child: Container(
              // color: Colors.green,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 3.0.wp,
                        ),
                        SizedBox(
                          height: 3.0.hp,
                          //  21,
                          width: 7.0.wp,
                          // 27,
                          child: Image.asset(
                            "images/photovideos.png",
                            // cacheHeight: 21,
                            // cacheWidth: 27,
                          ),
                        ),
                        SizedBox(
                          width: 4.0.wp,
                        ),
                        Text(
                          "Photos/video",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 10.0.sp,
                              color: text_2,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        SizedBox(
                          width: 3.0.wp,
                        ),
                        SizedBox(
                          height: 4.0.hp,
                          //  25,
                          width: 6.0.wp,
                          // 25,
                          child: Image.asset(
                            "images/tagpeople.png",
                            // cacheHeight: 25,
                            // cacheWidth: 25,
                          ),
                        ),
                        SizedBox(
                          width: 4.0.wp,
                        ),
                        Text(
                          "Tag People",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 10.0.sp,
                              color: text_2,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        SizedBox(
                          width: 3.0.wp,
                        ),
                        SizedBox(
                          height: 3.0.hp,
                          //  22,
                          width: 6.0.wp,
                          // 25,
                          child: Image.asset(
                            "images/camera.png",
                          ),
                        ),
                        SizedBox(
                          width: 4.0.wp,
                        ),
                        Text(
                          "Camera",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 10.0.sp,
                              color: text_2,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ]),
            ))
          ],
        ),
      ),
    );
  }
}
