import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_v2/widget/message_bubble.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("chat")
          .orderBy("createdAt", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text("No data Found!"),
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong!"),
          );
        }

        final loadedMessages = snapshot.data!.docs;
        final chatter = FirebaseAuth.instance.currentUser!;

        return ListView.builder(
            // padding: const EdgeInsets.only(bottom: 40, left: 15, right: 15),
            reverse: true,
            itemCount: loadedMessages.length,
            itemBuilder: (ctx, idx) {
              return MessageBubble(
                message: loadedMessages[idx].data()['text'],
                sender: chatter,
                isMe: loadedMessages[idx].data()['userid'] == chatter.uid,
                userImage: loadedMessages[idx].data()['userimage'],
              );
            });
      },
    );
  }
}
