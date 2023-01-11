import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'commentscreen.dart';

class Comment_UI extends StatefulWidget {
  var ontap;
  Comment_UI({Key? key, this.ontap}) : super(key: key);

  @override
  State<Comment_UI> createState() => _Comment_UIState();
}

class _Comment_UIState extends State<Comment_UI> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.ontap,
      //  {
      //   Get.to(CommentScreenDesign(postid: widget.ontap));
      // },
      // => ontap,
      child: Container(
        height: 3.5.hp,
        //  20,
        width: 6.0.wp,
        child: SizedBox(
            height: 2.0.hp,
            // 17,
            width: 5.0.wp,
            // 17,
            child: Image.asset("images/comment.png")),
      ),
    );
  }
}
