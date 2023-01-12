import 'package:animagieeui/config/extension.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';

// import '../Service/createcommend.dart';
import '../controller/commendcomtrollerlist.dart';
import '../controller/commentdeletcontroller.dart';
import '../controller/createcommentcontroller.dart';

class TestMe extends StatefulWidget {
  var postid;
  var username;
  var userimage;
  TestMe({super.key, this.postid, this.userimage, this.username});
  @override
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<TestMe> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  PostCommendListController postCommendListController =
      Get.put(PostCommendListController());
  CreateCommentController createCommend = Get.put(CreateCommentController());
  CommenddeletController commenddeletController =
      Get.put(CommenddeletController());
  @override
  void initState() {
    // TODO: implement initState
    postCommendListController.postcommed(widget.postid);
    super.initState();
  }

  // Widget commentChild(data) {
  //   return Obx(() {
  //     return ListView(
  //       children: [
  //         for (var i = 0; i < data; i++)
  //           Padding(
  //             padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
  //             child: ListTile(
  //               leading: GestureDetector(
  //                 onTap: () async {
  //                   // Display the image in large form.
  //                   print("Comment Clicked");
  //                 },
  //                 child: Container(
  //                   height: 50.0,
  //                   width: 50.0,
  //                   decoration: new BoxDecoration(
  //                       color: Colors.blue,
  //                       borderRadius:
  //                           new BorderRadius.all(Radius.circular(50))),
  //                   child: CircleAvatar(
  //                       radius: 50,
  //                       backgroundImage: CommentBox.commentImageParser(
  //                           imageURLorPath: data[i])),
  //                 ),
  //               ),
  //               title: Text(
  //                 data[i],
  //                 style: TextStyle(fontWeight: FontWeight.bold),
  //               ),
  //               subtitle: Text(data[i]),
  //               trailing: Text(data[i], style: TextStyle(fontSize: 10)),
  //             ),
  //           )
  //       ],
  //     );
  //   });
  // }

  back() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    // var datas = postCommendListController.data[0].data;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {});
              Get.back();
            }),
        title: Text("Comment Page",
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 11.0.sp,
                fontWeight: FontWeight.w500)),
        backgroundColor: Colors.white,
      ),
      body: WillPopScope(
        onWillPop: () => back(),
        child: Container(
          child: CommentBox(
              userImage: CommentBox.commentImageParser(
                  imageURLorPath: widget.userimage),
              labelText: 'Write a comment...',
              errorText: 'Comment cannot be blank',
              withBorder: false,
              sendButtonMethod: () {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    createCommend
                        .createcommentcontrollerfun(
                            commandword: commentController.text,
                            postid: widget.postid)
                        .then((value) async {
                      await postCommendListController.postcommed(widget.postid);
                    });
                  });
                  commentController.clear();
                  FocusScope.of(context).unfocus();
                } else {
                  print("Not validated");
                }
              },
              formKey: formKey,
              commentController: commentController,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              sendWidget:
                  const Icon(Icons.send_sharp, size: 30, color: Colors.white),
              child: Obx(() {
                if (postCommendListController.isLoadingService.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (postCommendListController.data.isEmpty) {
                  return const Center(
                      child: Text("You doesn't any command now"));
                } else {
                  var data = postCommendListController.data[0].data!;
                  return ListView(
                    children: [
                      for (var i = 0;
                          i < postCommendListController.data[0].data!.length;
                          i++)
                        Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () async {
                                      // Display the image in large form.
                                      print("Comment Clicked");
                                    },
                                    child: Container(
                                      height: 50.0,
                                      width: 50.0,
                                      decoration: const BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      child: CircleAvatar(
                                          radius: 50,
                                          backgroundImage: data[i]!
                                                  .makeBy!
                                                  .profileicon!
                                                  .isEmpty
                                              ? const ExactAssetImage(
                                                  'images/emptyimage.jfif')
                                              : CommentBox.commentImageParser(
                                                  imageURLorPath: data[i]!
                                                      .makeBy!
                                                      .profileicon
                                                      .toString())),
                                    ),
                                  ),
                                ),
                                Card(
                                  child: SizedBox(
                                    width: 65.0.wp,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            data[i]!
                                                .makeBy!
                                                .username
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                              fontSize: 11.0.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            data[i]!.commandword.toString(),
                                            style: GoogleFonts.poppins(
                                              color: Color(0xff6C6C6C),
                                              fontSize: 11.0.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    ///delete comment
                                    setState(() {
                                      commenddeletController
                                          .mydeletcomment(
                                              commandid: data[i]!.id.toString())
                                          .then((value) async {
                                        await postCommendListController
                                            .postcommed(widget.postid);
                                      });
                                    });
                                  },
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 60.0.sp),
                              alignment: Alignment.centerRight,
                              child: Text(
                                "${data[i]!.createdAt!.hour} hr ago",
                                // "${data[i]!.createdAt!.day}",
                                style: GoogleFonts.poppins(
                                  color: Color(0xff787878),
                                  fontSize: 8.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  );
                }
                // commentChild(postCommendListController.data[0].data!);
              })),
        ),
      ),
    );
  }
}
