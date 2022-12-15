// import 'package:animagieeui/config/extension.dart';
// import 'package:animagieeui/view/chats/sendbox.dart';

// import 'package:flutter/material.dart';

// import 'groupchatlistcontent.dart';
// import 'groupchatoption.dart';

// class GroupMulti_Chat_Page_UI extends StatelessWidget {
//   GroupMulti_Chat_Page_UI({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height - 80,
//       child: Stack(children: [
//         Container(
//           child: Column(
//             children: [
//               Expanded(
//                   child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: 5,
//                       itemBuilder: (context, index) => GroupChat_List_Content(
//                             fetchindex: index,
//                           ))),
//               Send_Box_UI(),
//               SizedBox(
//                 height: 2.0.hp,
//               ),
//             ],
//           ),
//         ),
//         Group_Chat_Option_UI(),
//         // Single_Chat_Options_UI(),
//       ]),
//     );
//   }
// }
