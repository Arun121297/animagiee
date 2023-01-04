import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/colorconfig.dart';
import '../../homepage/view/bookmark.dart';
import '../../homepage/view/commend.dart';
import '../../homepage/view/likes.dart';
import '../../homepage/view/share.dart';
// import '../../homepage/bookmark.dart';
// import '../../homepage/commend.dart';
// import '../../homepage/likes.dart';
// import '../../homepage/share.dart';

class PostList_Content extends StatefulWidget {
  var fetchindex;
  PostList_Content({Key? key, this.fetchindex}) : super(key: key);

  @override
  State<PostList_Content> createState() => _PostList_ContentState();
}

class _PostList_ContentState extends State<PostList_Content> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              CircleAvatar(
                backgroundImage:
                    ExactAssetImage(controller.Home_Post[widget.fetchindex]),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Dogs ${widget.fetchindex}",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.5.sp,
                    color: buttonColor1_CL,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () => bottomsheet(),
                child: SizedBox(
                  height: 2.0.hp,
                  // 16,
                  width: 5.0.wp,
                  // 16,,
                  child: Image.asset(
                    "images/burger.png",
                    // cacheHeight: 16,
                    // cacheWidth: 16,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              )
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(Icons.menu),
              // )
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
          SizedBox(height: 1.0.hp
              // 12,
              ),
          Container(
            height: 35.0.hp,
            //  346,
            width: 95.0.wp,
            // 346,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0.sp),
              image: DecorationImage(
                image: AssetImage(controller.Home_Post[widget.fetchindex]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0.sp),
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
                SizedBox(width: 8.0.wp
                    // 12,
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
            Likes_UI(
              onTap: () {},
              status: null!,
            ),
            const Comment_UI(),
            const Share_UI(),
            Expanded(child: Container()),
            const BookMarkUI(),
          ])
        ],
      ),
    );
  }

  bottomsheet() {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return SizedBox(
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
              const Divider(
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
              const Divider(
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
