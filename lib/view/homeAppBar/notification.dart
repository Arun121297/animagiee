import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Notification_UI extends StatefulWidget {
  const Notification_UI({Key? key}) : super(key: key);

  @override
  State<Notification_UI> createState() => _Notification_UIState();
}

class _Notification_UIState extends State<Notification_UI> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: 5.2.hp,
        width: 5.2.wp,
        // height: 19,
        // width: 19,
        child: Image.asset("images/notification.png"),
      ),
    );
  }
}
