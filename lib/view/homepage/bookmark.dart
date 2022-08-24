import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookMark_UI extends StatefulWidget {
  const BookMark_UI({Key? key}) : super(key: key);

  @override
  State<BookMark_UI> createState() => _BookMark_UIState();
}

class _BookMark_UIState extends State<BookMark_UI> {
  final Icon like = Icon(
    Icons.bookmark,
    color: Colors.black,
    size: 20.0.sp,
  );
  final Icon unlike = Icon(
    Icons.bookmark_border_outlined,
    size: 20.0.sp,
  );
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            if (click == false) {
              click = true;
            } else {
              click = false;
            }
          });
        },
        icon: click == false ? unlike : like);
  }
}
