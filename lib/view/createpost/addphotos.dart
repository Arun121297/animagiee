import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../config/colorconfig.dart';

class Add_Photos_UI extends StatefulWidget {
  const Add_Photos_UI({Key? key}) : super(key: key);

  @override
  State<Add_Photos_UI> createState() => _Add_Photos_UIState();
}

class _Add_Photos_UIState extends State<Add_Photos_UI> {
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
                Icons.camera_alt,
                color: animagiee_CL,
              ),
              Text("Add Photo"),
            ],
          ),
          height: 45,
          width: 150,
        ));
  }
}
