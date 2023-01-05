import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/instancepage/controller/communiti_userList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'page2communitielist.dart';

// class UserPage_Communitie_Page2 extends StatefulWidget {
//   const UserPage_Communitie_Page2({Key? key}) : super(key: key);

//   @override
//   State<UserPage_Communitie_Page2> createState() =>
//       _UserPage_Communitie_Page2State();
// }

// class _UserPage_Communitie_Page2State extends State<UserPage_Communitie_Page2> {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
class UserPage_Communitie_Page2 extends StatefulWidget {
  String id;
  UserPage_Communitie_Page2({required this.id});

  @override
  State<UserPage_Communitie_Page2> createState() =>
      _UserPage_Communitie_Page2State();
}

class _UserPage_Communitie_Page2State extends State<UserPage_Communitie_Page2> {
  CommunitiPostListController communitiPostListController =
      Get.put(CommunitiPostListController());
  @override
  void initState() {
    communitiPostListController.communitiListPost(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: communitiPostListController.data.length,
          itemBuilder: (context, index) => Page2_Communitie_List(
                name:
                    communitiPostListController.data[index].clubName.toString(),
                icon:
                    communitiPostListController.data[index].clubicon.toString(),
                id: communitiPostListController.data[index].clubid.toString(),
                userId: widget.id,
              ));
    });
  }
}
