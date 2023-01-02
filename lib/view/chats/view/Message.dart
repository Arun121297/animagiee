import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

class Message extends StatefulWidget {
  var text;
  var date;
  var isSentByMe = false;
  Message({this.date, required this.isSentByMe, this.text});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Message(isSentByMe: false);
  }
}
