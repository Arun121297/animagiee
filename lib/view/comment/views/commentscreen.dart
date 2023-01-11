import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/comment/controllers/comment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'commentlist.dart';

class CommentScreen extends StatefulWidget {
  CommentScreen({super.key, required this.postId});
  String? postId;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  CommentController commentController = Get.put(CommentController());

  back(context) {
    Get.back();
    setState(() {});
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() {
    Future.delayed(Duration.zero, () async {
      await commentController.getComment(postId: widget.postId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.black,
                  // size: 47,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        backgroundColor: Colors.white,
        elevation: 3,
        centerTitle: true,
        title: Text(
          "Comment",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 11.0.sp,
              color: const Color(0xFF000000)),
        ),
      ),
      body: Obx(
        () {
          if (commentController.isCommentLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (commentController.commentList.isEmpty ||
              commentController.commentList.first.data!.isEmpty) {
            return const Center(
              child: Text("No data found"),
            );
          } else {
            var data = commentController.commentList.first.data;
            return WillPopScope(
              onWillPop: () => back(context),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Material(
                    //   elevation: 3,
                    //   child: Container(
                    //       alignment: Alignment.center,
                    //       height: 7.0.hp,
                    //       width: MediaQuery.of(context).size.width,
                    //       child: const Text("Comments")),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.all(10.0.sp),
                    //   child: Text(
                    //     'All comments',
                    //     style: GoogleFonts.poppins(
                    //         fontWeight: FontWeight.w400,
                    //         fontSize: 11.0.sp,
                    //         color: const Color(0xFF333333)),
                    //   ),
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 17.5.hp,
                      //  80.0.hp,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox();
                        },
                        itemCount: data!.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return CommentList(
                            index: index,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
