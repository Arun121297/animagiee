import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 12.0.sp,
          ),
          onPressed: () {},
        ),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Create Post",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 10.0.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          // TextStyle(color: Colors.black, fontSize: 12),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
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
                "Write SomeThing .......",
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
              child: Column(children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.photo_library_sharp,
                        color: animagiee_CL,
                      ),
                    ),
                    Text(
                      "Photos",
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
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.person_add,
                        color: animagiee_CL,
                      ),
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
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt,
                        color: animagiee_CL,
                      ),
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
