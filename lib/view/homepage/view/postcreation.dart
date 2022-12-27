import 'dart:developer';
import 'dart:io';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/data/pages.dart';
import 'package:animagieeui/view/homepage/view/homepage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';
import '../../createpost/view/videoplayer.dart';
import '../../homeAppBar/view/appbar.dart';
import '../controller/createpostsingle.dart';
import '../controller/homescreen1controller.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  HomescreenCreatePost homescreenCreatePost = Get.put(HomescreenCreatePost());
  @override
  void initState() {
    // TODO: implement initState
    // Get.delete<UserPostListController>();
    homescreenCreatePost.filepick = File('');
    homescreenCreatePost.description.text = '';
    super.initState();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose

  //   super.dispose();
  // }

// HomescreenCreatePost homescreenCreatePost = Get.put(HomescreenCreatePost());
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text: "Karthi - ",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 11.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            /*defining default style is optional */
                            children: <TextSpan>[
                              TextSpan(
                                text: ' with',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 10.5.sp,
                                    color: Color(0xff898989),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: " arun and ",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 10.5.sp,
                                    color: Color(0xff898989),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: '\n 3 others',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 10.5.sp,
                                    color: Color(0xff898989),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      // Text(
                      //   "Karthi",
                      //   style: GoogleFonts.poppins(
                      //     textStyle: TextStyle(
                      //       fontSize: 12.0.sp,
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.w600,
                      //     ),
                      //   ),
                      // ),
                      // Text(
                      //   "# Karthi post ",
                      //   style: GoogleFonts.poppins(
                      //     textStyle: TextStyle(
                      //       fontSize: 8.0.sp,
                      //       color: Colors.grey,
                      //       fontWeight: FontWeight.w600,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      homescreenCreatePost.individualpost();
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
            SizedBox(height: 1.5.hp
                // 42,
                ),
            Column(
              children: [
                Container(
                  height: 15.0.hp,
                  //  354,
                  width: 350,
                  // MediaQuery.of(context).size.width,
                  // color: Colors.orange,
                  margin: EdgeInsets.only(left: 5.0.sp),
                  child: TextField(
                    controller: homescreenCreatePost.description,
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
                Visibility(
                  visible:
                      homescreenCreatePost.filepick.path.isEmpty ? false : true,
                  child: Container(
                      margin: EdgeInsets.only(right: 15),
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Upload again",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 11.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.upload,
                            color: animagiee_CL,
                          )
                        ],
                      )),
                ),
                Visibility(
                  visible:
                      homescreenCreatePost.filepick.path.isEmpty ? false : true,
                  child: homescreenCreatePost.imagevideo.value.type == "image"
                      ? Container(
                          height: 250,
                          //  134,
                          width: MediaQuery.of(context).size.width,
                          // 339,
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            // image: DecorationImage(
                            //   fit: BoxFit.cover,
                            //   image: FileImage(File(homescreenCreatePost
                            //       .imagevideo.value.url
                            //       .toString())),
                            // ),
                            borderRadius: BorderRadius.circular(8.0.sp),
                          ),
                          child: Image.file(File(
                              homescreenCreatePost.imagevideo.value.url!.path)))
                      : Container(
                          height: 250,
                          //  134,
                          width: MediaQuery.of(context).size.width,
                          // 339,
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0.sp),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Video_Player(
                                urls: homescreenCreatePost
                                    .imagevideo.value.url!.path),
                          ),
                        ),

                  // Container(
                  //   height: 250,
                  //   margin: EdgeInsets.all(15),
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: BoxDecoration(
                  //     // color: Colors.amber,
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: Image.file(homescreenCreatePost.filepick,
                  //       fit: BoxFit.cover),
                  // ),
                )
              ],
            ),
            Visibility(
                visible:
                    homescreenCreatePost.filepick.path.isEmpty ? true : false,
                child: Container(
                  margin: EdgeInsets.all(15),
                  height: 250,
                )),
            Expanded(
                child: Container(
              // color: Colors.green,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        filepicker();
                        // filepickervideo();
                        setState(() {});
                      },
                      child: SizedBox(
                        child: Row(
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
                      ),
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
                    GestureDetector(
                      onTap: () {
                        camera();
                        // videocamera();
                        setState(() {});
                      },
                      child: SizedBox(
                        child: Row(
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
                      ),
                    ),
                  ]),
            ))
          ],
        ),
      ),
    );
  }

  filepicker() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        homescreenCreatePost.filepick = File(file.path.toString());
        log("${homescreenCreatePost.filepick.path}");
        // controller.file = File(result.path);
        file.extension == "jpg"
            ? homescreenCreatePost.imagevideo(PostFilepickerType(
                type: "image", url: homescreenCreatePost.filepick))
            : homescreenCreatePost.imagevideo(PostFilepickerType(
                type: "video", url: homescreenCreatePost.filepick));
        log("type-->${homescreenCreatePost.imagevideo.value.url}");
        log("type-->${homescreenCreatePost.imagevideo.value.type}");
      });
      // print(file.name);
      // print(file.bytes);
      // print(file.size);
      // print(file.extension);
      // print(file.path);
    } else {
      return null;
      // User canceled the picker
    }
    // final ImagePicker imagePicker = ImagePicker();

    // final result = await imagePicker.pickImage(source: ImageSource.gallery);

    // if (result != null) {
    //   setState(() {
    //     homescreenCreatePost.filepick = File(result.path);
    //     log("${homescreenCreatePost.filepick.path}");
    //     // controller.file = File(result.path);
    //     homescreenCreatePost
    //         .imagevideo(PostFilepickerType(type: "image", url: result.path));
    //     homescreenCreatePost
    //         .imagevideo(PostFilepickerType(type: "video", url: result.path));
    //     log("type-->${homescreenCreatePost.imagevideo.value.type}");
    //   });
    // } else {
    //   return null;
    // }
  }

  camera() async {
    final ImagePicker imagePicker = ImagePicker();

    final result = await imagePicker.pickImage(source: ImageSource.camera);

    if (result != null) {
      setState(() {
        homescreenCreatePost.filepick = File(result.path);
        log("${homescreenCreatePost.filepick.path}");
        // clubController.pFprofileimage = File(result.path);
        // log("${clubController.pFprofileimage.path}");
        // controller.file = File(result.path);
        // homescreenCreatePost
        //     .imagevideo(PostFilepickerType(type: "image", url: result.path));
        // homescreenCreatePost
        //     .imagevideo(PostFilepickerType(type: "video", url: result.path));
        // controller.imagevideo(FilepickerType(type: "image", url: result.path));
      });
    } else {
      return null;
    }
  }
}
