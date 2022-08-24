import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../config/colorconfig.dart';

class Tag_People_UI extends StatefulWidget {
  const Tag_People_UI({Key? key}) : super(key: key);

  @override
  State<Tag_People_UI> createState() => _Tag_People_UIState();
}

class _Tag_People_UIState extends State<Tag_People_UI> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
          elevation: 3,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.tag_faces_sharp,
                    color: animagiee_CL,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Tag People"),
                ],
              ),
            ),
            height: 45,
            width: 339,
          )),
    );
  }
}
