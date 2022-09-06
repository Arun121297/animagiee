import 'package:flutter/material.dart';

import 'groupchatappbar.dart';
import 'groupchatpage.dart';

class Group_Chat_Screen_UI extends StatelessWidget {
  const Group_Chat_Screen_UI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        children: [GroupChat_AppBar_UI(), GroupMulti_Chat_Page_UI()],
      )),
    );
  }
}
// class Group_Chat_Screen_UI extends StatefulWidget {
//   const Group_Chat_Screen_UI({Key? key}) : super(key: key);

//   @override
//   State<Group_Chat_Screen_UI> createState() => _Group_Chat_Screen_UIState();
// }

// class _Group_Chat_Screen_UIState extends State<Group_Chat_Screen_UI> {
//   Controller controller = Get.put(Controller());
//   @override
//   Widget build(BuildContext context) {
 
//   }
// }
