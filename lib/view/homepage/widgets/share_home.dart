// import 'package:bemeli_update/view/bemeli_update.dart';

import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/dynamiclinkController.dart';

// import '../../services/dynamic_link/dynamic_link_service_home.dart';

class ShareHome extends StatefulWidget {
  final String title;
  final String desc;
  final String id;
  final String image;
  ShareHome(
      {Key? key,
      required this.desc,
      required this.id,
      required this.image,
      required this.title})
      : super(key: key);

  @override
  State<ShareHome> createState() => _ShareHomeState();
}

class _ShareHomeState extends State<ShareHome> {
  DynamicLinkHomeController dynamicLinkHomeController =
      Get.put(DynamicLinkHomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          onPressed: dynamicLinkHomeController.isNull.isFalse
              ? () {
                  dynamicLinkHomeController.shareProductLink(
                      postId: widget.id,
                      postImage: widget.image,
                      postTitle: widget.title,
                      postDesc: widget.desc);
                }
              : null,
          icon: dynamicLinkHomeController.isNull.isFalse
              ? Icon(
                  Icons.share_outlined,
                  size: 18.0.sp,
                )
              : Transform.scale(
                  scale: 0.5,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ));
    });
  }
}
