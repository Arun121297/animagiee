import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

import 'groupchatappbar.dart';
import 'groupchatlistcontent.dart';
import 'groupchatoption.dart';
import 'groupchatpage.dart';
import 'sendbox.dart';

class Group_Chat_Screen_UI extends StatelessWidget {
  const Group_Chat_Screen_UI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: Stack(children: [
      Container(
        child: Stack(children: [
          Column(
            children: [
              GroupChat_AppBar_UI(),
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) => GroupChat_List_Content(
                            fetchindex: index,
                          ))),
              // Group_Chat_Option_UI(),
              Send_Box_UI(),
              SizedBox(
                height: 2.0.hp,
              ),
              //   ],
              // ),
            ],
          ),
          Positioned(
              top: 10.0.sp, right: 10.0.sp, child: Group_Chat_Option_UI()),
        ]),
      ),
    ])));
  }
}
// Scaffold(
//         body: SafeArea(
//             child: Stack(children: [
//       Container(
//         child: Column(children: [
//           GroupChat_AppBar_UI(),
//           Expanded(
//               child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: 5,
//                   itemBuilder: (context, index) => GroupChat_List_Content(
//                         fetchindex: index,
//                       ))),
//           Send_Box_UI(),
//           SizedBox(
//             height: 2.0.hp,
//           ),
//           //   ],
//           // ),
//           Group_Chat_Option_UI(),
//         ]),
//       ),
//     ])));