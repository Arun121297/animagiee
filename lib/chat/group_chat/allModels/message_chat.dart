import '../allModels/reply_chat.dart';
import '../allConstents/firestore_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageChat {
  String idFrom;
  String idTo;
  String timestamp;
  String content;
  int type;
  dynamic reply;
  String deleteForMe;

  MessageChat({
    required this.idFrom,
    required this.idTo,
    required this.timestamp,
    required this.content,
    required this.type,
    required this.reply,
    required this.deleteForMe,
  });

  Map<String, dynamic> toJson() {
    return {
      FirestoreConstants.idFrom: idFrom,
      FirestoreConstants.idTo: idTo,
      FirestoreConstants.timestamp: timestamp,
      FirestoreConstants.content: content,
      FirestoreConstants.type: type,
      FirestoreConstants.reply: reply != null ? reply.toJson() : null,
      FirestoreConstants.deleteForMe: deleteForMe,
    };
  }

  // static MessageChat fromJson(Map<String, dynamic> json) => MessageChat(
  //       idFrom: json[FirestoreConstants.idFrom],
  //       idTo: json[FirestoreConstants.idTo],
  //       timestamp: json[FirestoreConstants.timestamp],
  //       content: json[FirestoreConstants.content],
  //       type: json[FirestoreConstants.type],
  //       reply: MessageChat.fromJson(json[FirestoreConstants.reply]),
  //     );

  factory MessageChat.fromDocument(DocumentSnapshot doc) {
    String idFrom = doc.get(FirestoreConstants.idFrom);
    String idTo = doc.get(FirestoreConstants.idTo);
    String timestamp = doc.get(FirestoreConstants.timestamp);
    String content = doc.get(FirestoreConstants.content);
    int type = doc.get(FirestoreConstants.type);
    String deleteForMe = doc.get(FirestoreConstants.deleteForMe);
    dynamic reply = doc.get(FirestoreConstants.reply);
    dynamic rply;
    if (reply != null) {
      rply = ReplyChat(
          content: reply['content'],
          timestamp: reply['timestamp'],
          idFrom: reply['idFrom'],
          idTo: reply['idTo'],
          type: reply['type']);
    } else {
      rply = null;
    }

    return MessageChat(
        idFrom: idFrom,
        idTo: idTo,
        timestamp: timestamp,
        content: content,
        type: type,
        deleteForMe: deleteForMe,
        reply: rply);
  }
}
