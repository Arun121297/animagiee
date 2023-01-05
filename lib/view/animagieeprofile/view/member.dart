import 'package:animagieeui/view/instancepage/controller/memberlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'memberlist.dart';

class Pageview2_Member extends StatefulWidget {
  String id;
  Pageview2_Member({required this.id});

  @override
  State<Pageview2_Member> createState() => _Pageview2_MemberState();
}

class _Pageview2_MemberState extends State<Pageview2_Member> {
  MemberListController memberListController = Get.put(MemberListController());

  @override
  void initState() {
    memberListController.memberListPost(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
                  itemCount: memberListController.memberData.length,
          itemBuilder: (BuildContext context, int index) => Member_List_Content(
                index: index,
              ));
            
            
    });
  }
}
