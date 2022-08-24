import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Search_UI extends StatefulWidget {
  const Search_UI({Key? key}) : super(key: key);

  @override
  State<Search_UI> createState() => _Search_UIState();
}

class _Search_UIState extends State<Search_UI> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(Icons.search));
  }
}
