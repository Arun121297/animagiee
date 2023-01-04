import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/instancepage/controller/userprofie_viewController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../config/colorconfig.dart';

class Profile_BG_Image_UI extends StatefulWidget {
  const Profile_BG_Image_UI({Key? key}) : super(key: key);

  @override
  State<Profile_BG_Image_UI> createState() => _Profile_BG_Image_UIState();
}

class _Profile_BG_Image_UIState extends State<Profile_BG_Image_UI> {
  UserPostProfileController userPostProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          shrinkWrap: true,

          //  scrollDirection: Axis.vertical,
          itemCount: userPostProfileController.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                  color: animagiee_CL,
                  image: DecorationImage(
                      image: NetworkImage(
                        userPostProfileController.data[index].profilebackimg
                            .toString(),
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0.sp),
                      bottomRight: Radius.circular(15.0.sp))),
              width: MediaQuery.of(context).size.width,
              height: 16.0.hp,
              // 108,
              // child: Image.asset("images/groupphoto.jpg", fit: BoxFit.cover),
            );
          });
    });
  }
}
