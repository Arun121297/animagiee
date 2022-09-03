import 'dart:io';

import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/bottombarfile/bottomnavibar.dart';
import 'package:animagieeui/view/createpost/post.dart';
import 'package:animagieeui/view/createpost/postmethod.dart';
import 'package:animagieeui/view/createpost/tagpeople.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'adddescription.dart';
import 'addphotos.dart';
import 'addvideos.dart';
import 'creategroup.dart';

class UserProfile_CreatePost_UI extends StatefulWidget {
  UserProfile_CreatePost_UI({Key? key}) : super(key: key);

  @override
  State<UserProfile_CreatePost_UI> createState() =>
      _UserProfile_CreatePost_UIState();
}

class _UserProfile_CreatePost_UIState extends State<UserProfile_CreatePost_UI> {
  @override
  void initState() {
    // print("print:::${a}");
    // TODO: implement initState
    super.initState();
  }

  Controller controller = Get.put(Controller());
  bool posttype_bool = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Customized_Bottom_Bar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.cusapp("Post", context),
            SizedBox(
              height: 22,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("Post Type"),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Post_Method_UI(),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("Select group"),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Create_Post_UI(),
                    Emogie_Description_UI(),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Add_Photos_UI(), Add_Video_UI()],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Visibility(
                        visible: controller.file.path.isEmpty ? false : true,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 134,
                              width: 339,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: FileImage(
                                    File(controller.file.path),
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(width: 2, color: animagiee_CL),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Tag_People_UI(),
                    Post_Button_UI(),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
