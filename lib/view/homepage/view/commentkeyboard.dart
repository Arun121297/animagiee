import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

import '../../../config/colorconfig.dart';
import '../Service/createcommend.dart';
import '../controller/createcommentcontroller.dart';

class Commentkeyboard extends StatefulWidget {
  var postid;
  Commentkeyboard({super.key, this.postid});

  @override
  State<Commentkeyboard> createState() => _CommentkeyboardState();
}

class _CommentkeyboardState extends State<Commentkeyboard> {
  CreateCommentController createCommend = Get.put(CreateCommentController());
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(
        mediaQuery.width * 0.03,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: mediaQuery.width * 0.015,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    mediaQuery.width * 0.03,
                  ),
                  color: Colors.white),
              child: Row(
                children: [
                  // Material(
                  //   borderRadius: BorderRadius.circular(
                  //     mediaQuery.width * 0.03,
                  //   ),
                  //   color: Colors.white,
                  //   child: SizedBox(
                  //     height: mediaQuery.width * 0.1,
                  //     width: mediaQuery.width * 0.1,
                  //     child: IconButton(
                  //       icon: const Icon(Icons.camera_enhance),
                  //       onPressed: () {},
                  //       color: animagiee_CL,
                  //     ),
                  //   ),
                  // ),
                  Material(
                    borderRadius: BorderRadius.circular(
                      mediaQuery.width * 0.03,
                    ),
                    color: Colors.white,
                    child: SizedBox(
                      height: mediaQuery.width * 0.1,
                      width: mediaQuery.width * 0.1,
                      child: IconButton(
                        icon: const Icon(Icons.face_retouching_natural),
                        onPressed: () {},
                        color: animagiee_CL,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.width * 0.12,
                    child: Container(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  SizedBox(
                    width: mediaQuery.width * 0.018,
                  ),
                  Flexible(
                    child: TextField(
                      onChanged: (value) {
                        createCommend.commentstring.value = value;
                        setState(() {});
                      },
                      controller: createCommend.commenttext,
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Leave your Comment here...',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 5,
                    ),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(
                      mediaQuery.width * 0.03,
                    ),
                    color: Colors.white,
                    child: Container(
                      margin: EdgeInsets.only(
                        right: mediaQuery.width * 0.02,
                      ),
                      child: CircleAvatar(
                        backgroundColor: animagiee_CL,
                        child: IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () {
                            ///cal create commentapis
                            log(createCommend.commentstring.value);
                            log(widget.postid);
                            createCommend.createcommentcontrollerfun(
                                commandword: createCommend.commentstring.value,
                                postid: widget.postid);
                          },
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
