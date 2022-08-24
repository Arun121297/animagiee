import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Share_UI extends StatefulWidget {
  const Share_UI({Key? key}) : super(key: key);

  @override
  State<Share_UI> createState() => _Share_UIState();
}

class _Share_UIState extends State<Share_UI> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.share_outlined,
        size: 19.0.sp,
      ),
    );
  }
}
