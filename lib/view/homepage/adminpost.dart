import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';
import 'bookmark.dart';
import 'commend.dart';
import 'likes.dart';
import 'share.dart';
import 'bookmark.dart';
import 'commend.dart';

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
      height: MediaQuery.of(context).size.height - 228,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: controller.Home_Post.length,
        itemBuilder: (context, index) => Card(
          elevation: 3,
          child: Column(
            children: [
              Row(
                children: [
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
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
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
    );
  }
}
