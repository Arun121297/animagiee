import 'package:flutter/material.dart';

import '../homeAppBar/search.dart';

class Notification_AppBar_UI extends StatefulWidget {
  var title;
  Notification_AppBar_UI({Key? key, this.title}) : super(key: key);

  @override
  State<Notification_AppBar_UI> createState() => _Notification_AppBar_UIState();
}

class _Notification_AppBar_UIState extends State<Notification_AppBar_UI> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          // Back_Button_UI(),
          Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(widget.title),
          ),
          Expanded(child: Container()),
          Search_UI(),
          // Notification_UI(),
        ]),
      ),
    );
  }
}
