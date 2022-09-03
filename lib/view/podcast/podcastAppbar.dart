import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../homeAppBar/backbutton.dart';
import '../homeAppBar/notification.dart';

class PodCast_AppBar_UI extends StatefulWidget {
  const PodCast_AppBar_UI({Key? key}) : super(key: key);

  @override
  State<PodCast_AppBar_UI> createState() => _PodCast_AppBar_UIState();
}

class _PodCast_AppBar_UIState extends State<PodCast_AppBar_UI> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          Back_Button_UI(),
          Flexible(child: Container()),
          // Expanded(child: SizedBox()),
          SizedBox(
            width: 13.0.wp,
            //  45,
          ),
          Text("Audio podcast"),
          Flexible(child: Container()),
          Flexible(child: Container()),

          // Expanded(child: Container()),
          // Search_UI(),
          Notification_UI(),
        ]),
      ),
    );
  }
}
