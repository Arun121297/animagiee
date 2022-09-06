import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/data/pages.dart';
import 'package:animagieeui/view/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      body: SafeArea(
        child: Column(
          children: [
            controller.chatapp("Create Post", Home_Page(), context),
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
                  Container(
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: 42,
            ),
            Container(
              height: 47.0.hp,
              //  354,
              width: MediaQuery.of(context).size.width,
              // color: Colors.orange,
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "What’s on your mind ?",
                style: GoogleFonts.jost(
                  textStyle: TextStyle(
                    fontSize: 21.0.sp,
                    color: text_1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 3.0.wp,
                        ),
                        SizedBox(
                          height: 21,
                          width: 27,
                          child: Image.asset(
                            "images/photovideos.png",
                            // cacheHeight: 21,
                            // cacheWidth: 27,
                          ),
                        ),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: Icon(
                        //     Icons.photo_library_sharp,
                        //     color: animagiee_CL,
                        //   ),
                        // ),
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
                          height: 25,
                          width: 25,
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
                          height: 22,
                          width: 25,
                          child: Image.asset(
                            "images/camera.png",
                            // cacheHeight: 22,
                            // cacheWidth: 25,
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
