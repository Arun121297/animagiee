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
    return SizedBox(
      height: 2.5.hp,
      width: 5.0.wp,
      // 17,
      child: Image.asset("images/commend.png"),
    );
  }
}
