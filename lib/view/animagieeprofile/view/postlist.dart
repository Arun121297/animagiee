import 'dart:developer';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/homepage/widgets/home_widget.dart';
import 'package:animagieeui/view/instancepage/controller/communityPotsListController.dart';
import 'package:animagieeui/view/instancepage/controller/likeController.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
  int index;
  PostList_Content({Key? key, required this.index}) : super(key: key);

  @override
  State<PostList_Content> createState() => _PostList_ContentState();
}

class _PostList_ContentState extends State<PostList_Content> {
  Controller controller = Get.put(Controller());

  CommunityPostListContoller communityPostListContoller = Get.find();
  LikeContoller likeContoller = Get.put(LikeContoller());

  likePost({required String id, required int index}) {
    likeContoller.like(id: id, index: index);
    communityPostListContoller.communityPostListData[0].data![index].liked =
        !communityPostListContoller
            .communityPostListData[0].data![index].liked!;
    if (communityPostListContoller
        .communityPostListData[0].data![index].liked!) {
      communityPostListContoller.communityPostListData[0].data![index]
          .likecount = communityPostListContoller
              .communityPostListData[0].data![index].likecount! +
          1;
      log("${communityPostListContoller.communityPostListData[0].data![index].likecount}true");
    } else {
      communityPostListContoller.communityPostListData[0].data![index]
          .likecount = communityPostListContoller
              .communityPostListData[0].data![index].likecount! -
          1;
      log("${communityPostListContoller.communityPostListData[0].data![index].likecount}false");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  communityPostListContoller.communityPostListData[0]
                          .data![widget.index].postowner!.profileicon!.isEmpty
                      ? const CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              ExactAssetImage("images/profile_icon.png"),
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage(
                              communityPostListContoller
                                  .communityPostListData[0]
                                  .data![widget.index]
                                  .postowner!
                                  .profileicon
                                  .toString()),
                        ),

                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    communityPostListContoller.communityPostListData[0]
                        .data![widget.index].postowner!.username
                        .toString(),
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
                  communityPostListContoller
                      .communityPostListData[0].data![widget.index].description
                      .toString(),
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
              VisibilityDetector(
                key: Key(widget.index.toString()),
                child: GestureDetector(
                    child: MediaWidget(
                  mediaType: communityPostListContoller
                      .communityPostListData[0].data![widget.index].posttype!,
                  source: communityPostListContoller.communityPostListData[0]
                      .data![widget.index].addImagesOrVideos!,
                )),
                onVisibilityChanged: (visibilityInfo) {
                  // onVisibilityChanged(
                  //     VisibilityInfo.visibleFraction,
                  //     response.postId);
                },
              ),
              Padding(
                padding: EdgeInsets.all(10.0.sp),
                child: Row(
                  children: [
                    Text(
                      "${communityPostListContoller.communityPostListData[0].data![widget.index].likecount.toString()} Likes",
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
                      "${communityPostListContoller.communityPostListData[0].data![widget.index].postViewCount}  Views",
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
                  onTap: () {
                    likePost(
                        id: communityPostListContoller
                            .communityPostListData[0].data![widget.index].postid
                            .toString(),
                        index: widget.index);
                  },
                  status: communityPostListContoller
                      .communityPostListData[0].data![widget.index].liked!,
                ),
                const Comment_UI(),
                const Share_UI(),
                Expanded(child: Container()),
                const BookMarkUI(),
              ])
            ],
          ),
        ),
      ],
    );
  }

  bottomsheet() {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
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
