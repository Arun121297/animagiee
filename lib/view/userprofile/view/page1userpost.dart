import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/createpost/view/videoplayer.dart';
import 'package:animagieeui/view/instancepage/controller/userprofile_getpost.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';
import '../../homepage/view/bookmark.dart';
import '../../homepage/view/commend.dart';
import '../../homepage/view/likes.dart';
import '../../homepage/view/share.dart';

class UserProfile_Page1_UI extends StatefulWidget {
  String id;
  UserProfile_Page1_UI({required this.id});

  @override
  State<UserProfile_Page1_UI> createState() => _UserProfile_Page1_UIState();
}

class _UserProfile_Page1_UIState extends State<UserProfile_Page1_UI> {
  Controller controller = Get.put(Controller());
  UserPostProfilePostController userPostProfilePostController =
      Get.put(UserPostProfilePostController());
  @override
  void initState() {
    userPostProfilePostController.userProfilePost(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: MediaQuery.of(context).size.height - 250,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: userPostProfilePostController.data.length,
          itemBuilder: (context, index) => Card(
            elevation: 3,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          userPostProfilePostController.data[index].profileicon
                              .toString()),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      userPostProfilePostController.data[index].username
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
                      onTap: () => btmsheet(),
                      child: SizedBox(
                        height: 2.0.hp,
                        // 16,
                        width: 5.0.wp,
                        // 16,
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
                        fontSize: 9.0.sp,
                        color: dummycontent_Cl,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                userPostProfilePostController.data[index].posttype == "image"
                    ? Container(
                        height: 45.0.hp,
                        //  346,
                        width: 95.0.wp,
                        // 346,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0.sp),
                          image: DecorationImage(
                            image: NetworkImage(userPostProfilePostController
                                .data[index].addImagesOrVideos
                                .toString()),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        height: 20.0.hp,
                        //  134,
                        width: 93.0.wp,
                        // 339,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0.sp),
                          border: Border.all(width: 2, color: animagiee_CL),
                        ),
                        child: Video_Player(
                          urls: userPostProfilePostController
                              .data[index].addImagesOrVideos
                              .toString(),
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
                      const SizedBox(
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
                        userPostProfilePostController
                            .data[index].postViewPersons
                            .toString(),
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
                  const Likes_UI(),
                  const Comment_UI(),
                  const Share_UI(),
                  Expanded(child: Container()),
                  BookMarkUI(),
                ])
              ],
            ),
          ),
        ),
      );
    });
  }

  btmsheet() {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return SizedBox(
          height: 174,
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
