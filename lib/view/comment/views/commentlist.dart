import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/comment/controllers/comment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentList extends StatefulWidget {
  CommentList({super.key, required this.index});
  int? index;

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  CommentController commentController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var listData = commentController.commentList.first.data![widget.index!];
      return SizedBox(
          child: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: listData!.makeBy!.profileicon!.isEmpty
                  ? CircleAvatar(
                      radius: 25.0.sp,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          const AssetImage('images/profile_icon.png'),
                    )
                  : CircleAvatar(
                      radius: 25.0.sp,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          NetworkImage(listData.makeBy!.profileicon!),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: SizedBox(
                  width: 71.0.wp,
                  height: 68,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listData.makeBy!.username ?? "",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 10.0.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        listData.commandword ?? "",
                        style: GoogleFonts.poppins(
                            color: const Color(0xff6C6C6C),
                            fontSize: 10.0.sp,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        /*   Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 25.0.wp,
                ),
                //like
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 15.0.wp,
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            size: 11.0.sp,
                          ),
                          SizedBox(
                            width: 1.0.wp,
                          ),
                          Text(
                            "Like",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 10.0.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    //replay
                    SizedBox(
                      width: 19.0.wp,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 2.0.hp,
                            width: 3.0.hp,
                            child: Image.asset('images/comment.png'),
                          ),
                          SizedBox(
                            width: 1.0.wp,
                          ),
                          Text(
                            "Reply",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 10.0.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //replaied
                // Expanded(child: SizedBox()),
                Container(
                  margin: EdgeInsets.only(left: 60.0.sp),
                  // width: 10.0.wp,
                  child: Text(
                    "Replied(1)",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 10.0.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.0.hp,
            ),
            SizedBox(
              child: Row(
                children: [
                  SizedBox(
                    width: 25.0.wp,
                  ),
                  const CircleAvatar(backgroundColor: Colors.black),
                  SizedBox(
                    width: 2.0.wp,
                  ),
                  Text(
                    "Reply name",
                    style: GoogleFonts.poppins(
                        fontSize: 10.0.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 1.0.wp,
                  ),
                  SizedBox(
                    width: 25.0.wp,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      "Lorem Ipsum is simply 👍🏻",
                      style: GoogleFonts.poppins(fontSize: 10.0.sp),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 1.0.hp,
            ),
            SizedBox(
                child: Row(
              children: [
                SizedBox(
                  width: 25.0.wp,
                ),
                Text(
                  "Replied",
                  style: GoogleFonts.poppins(
                      fontSize: 8.0.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 1.0.wp,
                ),
                SizedBox(
                  height: 3.0.hp,
                  width: 4.0.wp,
                  child: Image.asset('images/replyshare.png'),
                )
              ],
            ))
          ],
        ),
      
       */
      ]));
    });
  }
}
