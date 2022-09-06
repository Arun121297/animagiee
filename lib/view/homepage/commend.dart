import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Comment_UI extends StatefulWidget {
  const Comment_UI({Key? key}) : super(key: key);

  @override
  State<Comment_UI> createState() => _Comment_UIState();
}

class _Comment_UIState extends State<Comment_UI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 3.5.hp,
      // width: 6.0.wp,
      height: 20,
      width: 20,
      // 17,
      // alignment: Alignment.center,
      child: SizedBox(
          height: 17, width: 17, child: Image.asset("images/comment.png")),
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //   image: AssetImage("images/comment.png"),
      //   filterQuality: FilterQuality.high,
      // )),
      // child: Image.asset("images/commend.png",),
    );
  }
}
