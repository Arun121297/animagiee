import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homeAppBar/prot.dart';
import 'package:animagieeui/view/homeAppBar/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'chat.dart';
import 'notification.dart';

class AppbarContainer extends StatefulWidget {
  const AppbarContainer({Key? key}) : super(key: key);

  @override
  State<AppbarContainer> createState() => _AppbarContainerState();
}

class _AppbarContainerState extends State<AppbarContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 7.0.hp,
        // 53.0.hp,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              width: 40.0.wp,
              // 122,
              height: 28.0.hp,
              child: Image.asset("images/ani.png"),
            ),
            Expanded(child: Container()),
            Search_UI(),
            Chat_Icon_UI(),
            PodCast_UI(),
            Notification_UI(),
            SizedBox(
              width: 5,
            )
          ],
        ),
      ),
    );
  }
}
