import 'dart:io';

import '../group_chat/allModels/message_chat.dart';
import '../group_chat/allConstents/firestore_constants.dart';
import '../group_chat/allModels/message_history_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupChatProvider extends GetxController {
  final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;
  RxBool isStatusUpdated = false.obs;

  GroupChatProvider({
    required this.firebaseFirestore,
    required this.prefs,
    required this.firebaseStorage,
  });

  UploadTask uploadFile(File image, String filename) {
    Reference reference = firebaseStorage.ref().child(filename);
    UploadTask uploadTask = reference.putFile(image);
    return uploadTask;
  }

  Future<void> updateDataFirestore(String collectionPath, String docPath,
      Map<String, dynamic> dataNeedUpdate) {
    return firebaseFirestore
        .collection(collectionPath)
        .doc(docPath)
        .update(dataNeedUpdate);
  }

  //update online status
  Future<void> updateOnlineStatus(String collectionPath, String docPath,
      Map<String, dynamic> dataNeedUpdate) {
    return firebaseFirestore
        .collection(collectionPath)
        .doc(docPath)
        .update(dataNeedUpdate);
  }

  //update online status

  //get online status
  Stream<DocumentSnapshot> getOnlineStatus(String docPath) {
    return firebaseFirestore
        .collection(FirestoreConstants.pathUserCollection)
        .doc(docPath)
        .snapshots();
  }
  //get online status

  //get user seen status
  Stream<DocumentSnapshot> getUserSeenStatus(
      String peerId, String groupChatId) {
    return firebaseFirestore
        .collection(FirestoreConstants.groupHistory)
        .doc(peerId)
        .collection(peerId)
        .doc(groupChatId)
        .snapshots();
  }
  //get user seen status

  Stream<QuerySnapshot> getChatStream(
      String groupChatId, int limit, String currentUserId) {
    return firebaseFirestore
        .collection(FirestoreConstants.pathMessageCollection)
        .doc(groupChatId)
        .collection(groupChatId)
        // .where(FirestoreConstants.deleteForMe, isNotEqualTo: currentUserId)
        // .orderBy(FirestoreConstants.deleteForMe, descending: true)
        .orderBy(FirestoreConstants.timestamp, descending: true)
        .limit(limit)
        .snapshots();
  }

  Stream<QuerySnapshot> getChatHistoryListStream(
      int limit, String currentUserId) {
    return firebaseFirestore
        .collection(FirestoreConstants.groupHistory)
        .doc(currentUserId)
        .collection(currentUserId)
        // .where(FirestoreConstants.deleteForMe, isNotEqualTo: currentUserId)
        .orderBy(FirestoreConstants.timestamp, descending: true)
        .limit(limit)
        .snapshots();
  }

  Future<void> sendMessage({
    required String content,
    required int type,
    required String groupChatId,
    required String currentUserId,
    required String peerId,
    required dynamic reply,
  }) async {
    int unseenMsgCount = 0;
    int unseenMsgCount2 = 0;

    //mesages node ref
    DocumentReference documentReference = firebaseFirestore
        .collection(FirestoreConstants.pathMessageCollection)
        .doc(groupChatId)
        .collection(groupChatId)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    MessageChat messageChat = MessageChat(
      idFrom: currentUserId,
      idTo: peerId,
      timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      type: type,
      reply: reply,
      deleteForMe: "",
    );

    //
    FirebaseFirestore.instance
        .collection(FirestoreConstants.groupHistory)
        .doc(currentUserId)
        .collection(currentUserId)
        .doc(groupChatId)
        .get()
        .then((doc) {
      if (doc.exists) {
        FirebaseFirestore.instance
            .collection(FirestoreConstants.groupHistory)
            .doc(peerId)
            .collection(peerId)
            .doc(groupChatId)
            .get()
            .then((doc) async {
          if (doc.exists) {
            //if Collection Present, set unseenMessageCount to increment of previous value
            //current user
            final DocumentSnapshot result = await firebaseFirestore
                .collection(FirestoreConstants.groupHistory)
                .doc(currentUserId)
                .collection(currentUserId)
                .doc(groupChatId)
                .get();
            final DocumentSnapshot<Object?> document = result;
            unseenMsgCount =
                document[FirestoreConstants.unseenMessageCount] + 1;

            //opp user
            final DocumentSnapshot result2 = await firebaseFirestore
                .collection(FirestoreConstants.groupHistory)
                .doc(peerId)
                .collection(peerId)
                .doc(groupChatId)
                .get();
            final DocumentSnapshot<Object?> document2 = result2;
            unseenMsgCount2 =
                document2[FirestoreConstants.unseenMessageCount] + 1;

            sendMess(
                content: content,
                currentUserId: currentUserId,
                peerId: peerId,
                type: type,
                documentReference: documentReference,
                groupChatId: groupChatId,
                messageChat: messageChat,
                reply: reply,
                unseenMsgCount: unseenMsgCount,
                unseenMsgCount2: unseenMsgCount2);
          } else {
            unseenMsgCount = 1;
            unseenMsgCount2 = 1;
            sendMess(
                content: content,
                currentUserId: currentUserId,
                peerId: peerId,
                type: type,
                documentReference: documentReference,
                groupChatId: groupChatId,
                messageChat: messageChat,
                reply: reply,
                unseenMsgCount: unseenMsgCount,
                unseenMsgCount2: unseenMsgCount2);
          }
        });
      } else {
        unseenMsgCount = 1;
        unseenMsgCount2 = 1;
        sendMess(
            content: content,
            currentUserId: currentUserId,
            peerId: peerId,
            type: type,
            documentReference: documentReference,
            groupChatId: groupChatId,
            messageChat: messageChat,
            reply: reply,
            unseenMsgCount: unseenMsgCount,
            unseenMsgCount2: unseenMsgCount2);
      }
    });
  }

  String peerName = '';
  String peerImage = '';
  String myName = '';
  String myImage = '';
  Future<bool> getProfileData(
      {required String peerId, required String currentUserId}) async {
    bool val = false;
    //get name and profile URL
    //PEER DATA
    final DocumentSnapshot result = await firebaseFirestore
        .collection(FirestoreConstants.pathUserCollection)
        .doc(peerId)
        .get();

    if (result.exists) {
      peerName = result.get('nickname');
      peerImage = result.get('photoUrl');

      //My DATA
      final DocumentSnapshot result2 = await firebaseFirestore
          .collection(FirestoreConstants.pathUserCollection)
          .doc(currentUserId)
          .get();

      if (result2.exists) {
        myName = result2.get('nickname');
        myImage = result2.get('photoUrl');
        val = true;
      }
    }

    //get name and profile URL
    return val;
  }

  Future<void> sendMess(
      {required String content,
      required int type,
      required String groupChatId,
      required String currentUserId,
      required String peerId,
      required dynamic reply,
      required MessageChat messageChat,
      required int unseenMsgCount,
      required int unseenMsgCount2,
      required DocumentReference documentReference}) async {
    //get name and profile URL
    getProfileData(currentUserId: currentUserId, peerId: peerId).then((value) {
      //chatHistoryList my node ref
      DocumentReference documentReference1 = firebaseFirestore
          .collection(FirestoreConstants.groupHistory)
          .doc(currentUserId)
          .collection(currentUserId)
          .doc(groupChatId);
      MessageHistoryItem messageHistoryChat1 = MessageHistoryItem(
          lastMessage: content,
          peerId: peerId,
          peerName: peerName,
          peerImage: peerImage,
          timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
          type: type,
          unseenMessageCount: unseenMsgCount);

      //chatHistoryList opp user node ref
      DocumentReference documentReference2 = firebaseFirestore
          .collection(FirestoreConstants.groupHistory)
          .doc(peerId)
          .collection(peerId)
          .doc(groupChatId);

      MessageHistoryItem messageHistoryChat2 = MessageHistoryItem(
          lastMessage: content,
          peerId: currentUserId,
          peerName: myName,
          peerImage: myImage,
          timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
          type: type,
          unseenMessageCount: unseenMsgCount2);

      FirebaseFirestore.instance.runTransaction((transaction) async {
        transaction.set(
          documentReference,
          messageChat.toJson(),
        );

        transaction.set(
          documentReference1,
          messageHistoryChat1.toJson(),
        );

        transaction.set(
          documentReference2,
          messageHistoryChat2.toJson(),
        );
      });
    });
    //get name and profile URL
  }

  // Future<void> blockUser(String currentUserId, String blockId) async {
  //   try {
  //     DocumentSnapshot snap = await firebaseFirestore
  //         .collection(FirestoreConstants.pathUserCollection)
  //         .doc(currentUserId)
  //         .get();
  //     await firebaseFirestore
  //         .collection(FirestoreConstants.pathUserCollection)
  //         .doc(blockId)
  //         .get();

  //     List blockedList =
  //         (snap.data()! as dynamic)[FirestoreConstants.blockedList];

  //     if (blockedList.contains(blockId)) {
  //       await firebaseFirestore
  //           .collection(FirestoreConstants.pathUserCollection)
  //           .doc(currentUserId)
  //           .update({
  //         'blockedList': FieldValue.arrayRemove([blockId])
  //       });
  //       await firebaseFirestore
  //           .collection(FirestoreConstants.pathUserCollection)
  //           .doc(blockId)
  //           .update({
  //         'blockedList': FieldValue.arrayRemove([currentUserId])
  //       });
  //     } else {
  //       await firebaseFirestore
  //           .collection(FirestoreConstants.pathUserCollection)
  //           .doc(currentUserId)
  //           .update({
  //         'blockedList': FieldValue.arrayUnion([blockId])
  //       });
  //       await firebaseFirestore
  //           .collection(FirestoreConstants.pathUserCollection)
  //           .doc(blockId)
  //           .update({
  //         'blockedList': FieldValue.arrayUnion([currentUserId])
  //       });
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future<void> blockUser(String currentUserId, String blockId) async {
    try {
      DocumentSnapshot snap = await firebaseFirestore
          .collection(FirestoreConstants.pathUserCollection)
          .doc(currentUserId)
          .get();

      List blockedList =
          (snap.data()! as dynamic)[FirestoreConstants.blockedList];

      if (blockedList.contains(blockId)) {
        await firebaseFirestore
            .collection(FirestoreConstants.pathUserCollection)
            .doc(currentUserId)
            .update({
          'blockedList': FieldValue.arrayRemove([blockId])
        });
        await firebaseFirestore
            .collection(FirestoreConstants.pathUserCollection)
            .doc(blockId)
            .update({
          'blockedBy': FieldValue.arrayRemove([currentUserId])
        });
      } else {
        await firebaseFirestore
            .collection(FirestoreConstants.pathUserCollection)
            .doc(currentUserId)
            .update({
          'blockedList': FieldValue.arrayUnion([blockId])
        });
        await firebaseFirestore
            .collection(FirestoreConstants.pathUserCollection)
            .doc(blockId)
            .update({
          'blockedBy': FieldValue.arrayUnion([currentUserId])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class TypeMessage {
  static const text = 0;
  static const image = 1;
  static const sticker = 2;
}
