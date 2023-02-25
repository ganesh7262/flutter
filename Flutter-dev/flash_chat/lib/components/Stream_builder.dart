import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'message_bubble.dart';

class StreamMsgHandler extends StatelessWidget {
  final firestore;
  final user;
  StreamMsgHandler({required this.firestore, required this.user});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        List<MessageBubble> messageWidgets = [];
        final message = snapshot.data!.docs;
        for (var msg in message) {
          final msgText = msg['text'];
          final msgSender = msg['email'];
          messageWidgets.add(
            MessageBubble(
              message: msgText,
              sender: msgSender,
              isMe: msgSender == user.email,
            ),
          );
        }
        return Expanded(
          child: ListView(
            reverse: true,
            children: messageWidgets,
          ),
        );
      },
    );
  }
}
