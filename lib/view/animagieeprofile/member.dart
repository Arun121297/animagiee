import 'package:flutter/material.dart';

import 'memberlist.dart';

class Pageview2_Member extends StatelessWidget {
  const Pageview2_Member({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 40,
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Member_List_Content()),
    );
  }
}
