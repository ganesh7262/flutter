import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessageBubble extends StatelessWidget {
  String message;
  User sender;
  bool isMe;
  String userImage;

  MessageBubble(
      {super.key,
      required this.message,
      required this.sender,
      required this.isMe,
      required this.userImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(userImage),
              ),
            ),
          Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                sender.email!,
                style: const TextStyle(color: Colors.black54, fontSize: 12.0),
              ),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.only(
                  topLeft:
                      isMe == true ? const Radius.circular(30) : Radius.zero,
                  topRight:
                      isMe == true ? Radius.zero : const Radius.circular(30),
                  bottomLeft: const Radius.circular(30),
                  bottomRight: const Radius.circular(30),
                ),
                color: isMe == true
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.inversePrimary,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    message,
                    style: TextStyle(
                        color: isMe == true ? Colors.white : Colors.black54,
                        fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
          if (isMe)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(userImage),
              ),
            ),
        ],
      ),
    );
  }
}
