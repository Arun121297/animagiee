import 'dart:developer';

import 'package:animagieeui/config/constant.dart';
import 'package:animagieeui/view/instancepage/controller/memberlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'memberlist.dart';

class Pageview2_Member extends StatefulWidget {
  String id;
  Pageview2_Member({required this.id});

  @override
  State<Pageview2_Member> createState() => _Pageview2_MemberState();
}

class _Pageview2_MemberState extends State<Pageview2_Member> {
  MemberListController memberListController = Get.put(MemberListController());
  String myUserId = "";

  @override
  void initState() {
    fetcData();
    fetchProfile();
    super.initState();
  }

  fetcData() {
    Future.delayed(Duration.zero, () async {
      await memberListController.memberListPost(widget.id);
    });
  }

  fetchProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    myUserId = pref.getString(Constant.userId)!;
    log("ccccccc$myUserId");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (memberListController.memberscreenloadingindicator.value ||
          myUserId.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (memberListController.memberData.isEmpty ||
          memberListController.memberData.first.data!.isEmpty) {
        return const Center(
          child: Text("No data found"),
        );
      } else {
        return ListView.builder(
            itemCount: memberListController.memberData.length,
            itemBuilder: (BuildContext context, int index) =>
                Member_List_Content(
                  index: index,
                  myUserId: myUserId,
                ));
      }
    });
  }
}
