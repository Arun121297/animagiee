import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/profilepage/view/MyFavourites/controllers/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteIcon extends StatefulWidget {
  FavouriteIcon({Key? key, required this.onTap, required this.status})
      : super(key: key);
  VoidCallback onTap;
  bool? status;

  @override
  State<FavouriteIcon> createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {
  FavouriteController controller = Get.put(FavouriteController());
  final Icon like = Icon(
    Icons.bookmark,
    color: Colors.black,
    size: 21.0.sp,
  );
  final Icon unlike = Icon(
    Icons.bookmark_border_outlined,
    size: 21.0.sp,
  );
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: widget.onTap,
        // () async {
        //   setState(() {});
        //   controller.likeList.removeAt(widget.index!);
        //   controller.myFavouriteList.first.data!.removeAt(widget.index!);
        //   controller.update(controller.myFavouriteList);
        //   await controller.removeFromFavourite(
        //       postId: widget.postId, index: widget.index);
        // },
        icon: !widget.status! ? unlike : like);
  }
}
