import '../allConstents/firestore_constants.dart';
import '../chat_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PopUpBlockButton extends StatelessWidget {
  const PopUpBlockButton({
    Key? key,
    required this.firebaseFirestore,
    required this.currentUserId,
    required this.peerId,
    required this.peerNickname,
    required this.chatProvider,
  }) : super(key: key);

  final FirebaseFirestore firebaseFirestore;
  final String currentUserId;
  final String peerId;
  final String peerNickname;
  final GroupChatProvider chatProvider;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.adaptive.more),
        onPressed: () async {
          DocumentSnapshot snapshot = await firebaseFirestore
              .collection(FirestoreConstants.pathUserCollection)
              .doc(currentUserId)
              .get();

          List blockedList = (snapshot.data()! as dynamic)["blockedList"];

          if (blockedList.contains(peerId)) {
            Future.delayed(
                const Duration(seconds: 0),
                () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: InkWell(
                            child: const Text('Unblock'),
                            onTap: () {
                              Navigator.of(context).pop();
                              Future.delayed(
                                  const Duration(seconds: 0),
                                  () => Future.delayed(
                                      const Duration(seconds: 0),
                                      () => showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Unblock $peerNickname?'),
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: const <Widget>[
                                                      Text(
                                                          'Are you sure you want to unblock this user?'),
                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: const Text('Cancel'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child:
                                                        const Text('Unblock'),
                                                    onPressed: () {
                                                      chatProvider.blockUser(
                                                          currentUserId,
                                                          peerId);
                                                      Navigator.of(context)
                                                          .pop();
                                                      const snackBar = SnackBar(
                                                          content: Text(
                                                              'You unblocked this user'));
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          )));
                            },
                          ),
                        );
                      },
                    ));
          } else {
            Future.delayed(
                const Duration(seconds: 0),
                () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: InkWell(
                            child: const Text('Block'),
                            onTap: () {
                              Navigator.of(context).pop();
                              Future.delayed(
                                  const Duration(seconds: 0),
                                  () => showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Block $peerNickname?'),
                                            content: SingleChildScrollView(
                                              child: ListBody(
                                                children: const <Widget>[
                                                  Text(
                                                      'Blocked users cannot send you messages.This user will not be notified.'),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: const Text('Block'),
                                                onPressed: () {
                                                  chatProvider.blockUser(
                                                      currentUserId, peerId);
                                                  Navigator.of(context).pop();
                                                  const snackBar = SnackBar(
                                                      content: Text(
                                                          'You blocked this user'));
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      ));
                            },
                          ),
                        );
                      },
                    ));
          }
        });
  }
}
