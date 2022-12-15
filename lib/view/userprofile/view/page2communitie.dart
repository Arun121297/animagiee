import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
class UserPage_Communitie_Page2 extends StatelessWidget {
  const UserPage_Communitie_Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) => Page2_Communitie_List()),
    );
  }
}
