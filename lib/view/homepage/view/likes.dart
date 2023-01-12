import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/controller/homescreen1controller.dart';
import 'package:animagieeui/view/instancepage/controller/likeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Likes_UI extends StatefulWidget {
  bool status;
  VoidCallback onTap;

  Likes_UI({required this.status, required this.onTap});

  @override
  State<Likes_UI> createState() => _Likes_UIState();
}

class _Likes_UIState extends State<Likes_UI> {
  UserPostListController userPostListController = Get.find();

  final Icon like = Icon(
    Icons.favorite,
    color: Colors.red,
    size: 20.0.sp,
  );
  final Icon unlike = Icon(
    Icons.favorite_outline,
    size: 20.0.sp,
  );
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: widget.onTap, icon: widget.status == true ? like : unlike);
  }
}
