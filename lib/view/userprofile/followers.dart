import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../config/colorconfig.dart';

class Followers_UI extends StatefulWidget {
  const Followers_UI({Key? key}) : super(key: key);

  @override
  State<Followers_UI> createState() => _Followers_UIState();
}

class _Followers_UIState extends State<Followers_UI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.0.hp,
      // 30,
      width: 33.0.wp,
      // 124,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: animagiee_CL,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Folloewes"),
          VerticalDivider(
            color: animagiee_CL,
          ),
          Text("95")
        ],
      ),
    );
  }
}
