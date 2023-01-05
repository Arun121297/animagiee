// import 'package:animagieeui/view/animagieeprofile/view/postlist.dart';
import 'dart:developer';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/animagieeprofile/view/postlist.dart';
import 'package:animagieeui/view/instancepage/controller/communityController.dart';
import 'package:animagieeui/view/instancepage/controller/communityPotsListController.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../controller/controller.dart';

class Pageview1_Post extends StatefulWidget {
  String id;
  String userId;
  Pageview1_Post({required this.id, required this.userId});

  @override
  State<Pageview1_Post> createState() => _Pageview1_PostState();
}

class _Pageview1_PostState extends State<Pageview1_Post> {
  Controller controller = Get.put(Controller());

  CommunityPostListContoller communityPostListContoller =
      Get.put(CommunityPostListContoller());

  @override
  void initState() {
    log(widget.userId);
    log(widget.id);
    communityPostListContoller.communityPostList(
      userId: widget.userId,
      id: widget.id,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        child: ListView.builder(
            itemCount: communityPostListContoller.communityPostListData.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => communityPostListContoller
                    .communityPostListData[0].data!.isEmpty
                ? SizedBox(
                    height: 50.0.hp,
                    child: Center(
                      child: Text("No Community Post"),
                    ),
                  )
                : PostList_Content(
                    index: index,
                  )),
      );
    });

    // SizedBox(
    //   // color: Colors.orange,
    //   height: MediaQuery.of(context).size.height,
    //   child: ListView.builder(
    //       // scrollDirection: Axis.vertical,
    //       physics: NeverScrollableScrollPhysics(),
    //       shrinkWrap: true,
    //       itemCount: controller.Home_Post.length,
    //       itemBuilder: (context, index) => PostList_Content(
    //             fetchindex: index,
    //           )),
    // );
  }
}
