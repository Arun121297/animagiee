import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

class Likes_UI extends StatefulWidget {
  const Likes_UI({Key? key}) : super(key: key);

  @override
  State<Likes_UI> createState() => _Likes_UIState();
}

class _Likes_UIState extends State<Likes_UI> {
  final Icon like = Icon(
    Icons.favorite,
    color: Colors.red,
    size: 20.0.sp,
  );
  final Icon unlike = Icon(
    Icons.favorite_border,
    size: 20.0.sp,
  );
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            if (click == false) {
              click = true;
            } else {
              click = false;
            }
          });
        },
        icon: click == true ? like : unlike);
  }
}
