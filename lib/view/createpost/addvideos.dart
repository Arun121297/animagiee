import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../config/colorconfig.dart';

class Add_Video_UI extends StatefulWidget {
  const Add_Video_UI({Key? key}) : super(key: key);

  @override
  State<Add_Video_UI> createState() => _Add_Video_UIState();
}

class _Add_Video_UIState extends State<Add_Video_UI> {
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.video_stable,
                color: animagiee_CL,
              ),
              Text("Videos"),
            ],
          ),
          height: 45,
          width: 150,
        ));
  }
}
