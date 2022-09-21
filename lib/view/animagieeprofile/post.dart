import 'package:animagieeui/view/animagieeprofile/postlist.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controller/controller.dart';

class Pageview1_Post extends StatelessWidget {
  Pageview1_Post({Key? key}) : super(key: key);
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: controller.Home_Post.length,
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => PostList_Content(
                fetchindex: index,
              )),
    );

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
