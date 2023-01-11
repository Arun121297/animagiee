// import 'package:animagieeui/view/animagieeprofile/view/postlist.dart';

import 'dart:developer';

import 'package:animagieeui/config/constant.dart';
import 'package:animagieeui/view/animagieeprofile/view/postlist.dart';
import 'package:animagieeui/view/instancepage/controller/communityPotsListController.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String? myUserId;

  @override
  void initState() {
    fetchData();
    fetchProfile();
    super.initState();
  }

  fetchProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    myUserId = pref.getString(Constant.userId);
    setState(() {});
    log("log ---->${myUserId}");
  }

  fetchData() {
    Future.delayed(Duration.zero, () {
      communityPostListContoller.communityPostList(
        userId: widget.userId,
        id: widget.id,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (communityPostListContoller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (communityPostListContoller.communityPostListData.isEmpty ||
          communityPostListContoller
              .communityPostListData.first.data!.isEmpty) {
        return const Center(
          child: Text("No data found"),
        );
      } else {
        var data = communityPostListContoller.communityPostListData.first.data!;
        return ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => PostList_Content(
                  index: index,
                  myUserId: myUserId,
                ));
      }
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
