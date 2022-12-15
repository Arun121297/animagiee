import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

class BookMark_UI extends StatefulWidget {
  const BookMark_UI({Key? key}) : super(key: key);

  @override
  State<BookMark_UI> createState() => _BookMark_UIState();
}

class _BookMark_UIState extends State<BookMark_UI> {
  final Icon like = Icon(
    Icons.bookmark,
    color: Colors.black,
    size: 21.0.sp,
  );
  final Icon unlike = Icon(
    Icons.bookmark_border_outlined,
    size: 21.0.sp,
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
