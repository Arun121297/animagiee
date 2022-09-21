import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

class Comment_UI extends StatelessWidget {
  const Comment_UI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.5.hp,
      //  20,
      width: 6.0.wp,
      child: SizedBox(
          height: 2.0.hp,
          // 17,
          width: 5.0.wp,
          // 17,
          child: Image.asset("images/comment.png")),
    );
  }
}
