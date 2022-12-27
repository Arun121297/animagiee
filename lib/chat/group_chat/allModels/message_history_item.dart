import '../allConstents/firestore_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageHistoryItem {
  String lastMessage;
  String timestamp;
  String peerId;
  String peerName;
  String peerImage;
  int type;
  int unseenMessageCount;

  MessageHistoryItem({
    required this.lastMessage,
    required this.timestamp,
    required this.peerId,
    required this.peerName,
    required this.peerImage,
    required this.type,
    required this.unseenMessageCount,
  });

  Map<String, dynamic> toJson() {
    return {
      FirestoreConstants.lastMessage: lastMessage,
      FirestoreConstants.timestamp: timestamp,
      FirestoreConstants.peerId: peerId,
      FirestoreConstants.peerName: peerName,
      FirestoreConstants.peerImage: peerImage,
      FirestoreConstants.type: type,
      FirestoreConstants.unseenMessageCount: unseenMessageCount,
    };
  }

  factory MessageHistoryItem.fromDocument(DocumentSnapshot doc) {
    String lastMessage = doc.get(FirestoreConstants.lastMessage);
    String timestamp = doc.get(FirestoreConstants.timestamp);
    String peerId = doc.get(FirestoreConstants.peerId);
    String peerName = doc.get(FirestoreConstants.peerName);
    String peerImage = doc.get(FirestoreConstants.peerImage);
    int type = doc.get(FirestoreConstants.type);
    int unseenMessageCount = doc.get(FirestoreConstants.unseenMessageCount);

    return MessageHistoryItem(
      lastMessage: lastMessage,
      timestamp: timestamp,
      peerId: peerId,
      peerName: peerName,
      peerImage: peerImage,
      type: type,
      unseenMessageCount: unseenMessageCount,
    );
  }
}
