import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'postcreation.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 9.0.hp,
      //  83,
      color: Colors.white70,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(backgroundImage: ExactAssetImage("images/Fishes.jpg")),
          VerticalDivider(color: Colors.transparent, width: 13),
          Container(
            width: 60.0.wp,
            // 218,
            height: 6.0.hp,
            // 43,
            child: TextField(
              // textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(
                    color: Colors.grey[300],
                  ),
                  hintText: "Write something here...",
                  fillColor: Colors.white70),
            ),
          ),
          // VerticalDivider(color: Colors.transparent, width: 13),
          IconButton(
            onPressed: () {
              Get.to(Post());
            },
            icon: Icon(Icons.photo_library_sharp),
          )
        ],
      ),
    );
  }
}
