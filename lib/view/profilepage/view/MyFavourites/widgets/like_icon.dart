import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/profilepage/view/MyFavourites/controllers/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikesUI extends StatefulWidget {
  LikesUI({Key? key, required this.status, required this.onTap})
      : super(key: key);
  bool? status;
  VoidCallback? onTap;
  @override
  State<LikesUI> createState() => _LikesUIState();
}

class _LikesUIState extends State<LikesUI> {
  FavouriteController controller = Get.find();
  final Icon like = Icon(
    Icons.favorite,
    color: Colors.red,
    size: 20.0.sp,
  );
  final Icon unlike = Icon(
    Icons.favorite_border,
    size: 22.0.sp,
  );
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: widget.onTap, icon: widget.status == true ? like : unlike);
  }
}
