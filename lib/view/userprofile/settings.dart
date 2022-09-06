import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../config/colorconfig.dart';

class Setting_UI extends StatefulWidget {
  const Setting_UI({Key? key}) : super(key: key);

  @override
  State<Setting_UI> createState() => _Setting_UIState();
}

class _Setting_UIState extends State<Setting_UI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: 31,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: animagiee_CL,
        ),
      ),
      child: Icon(Icons.settings),
    );
  }
}
