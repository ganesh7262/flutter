import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessageBubble extends StatelessWidget {
  String message;
  String sender;
  bool isMe;
  MessageBubble(
      {required this.message, required this.sender, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(color: Colors.black54, fontSize: 12.0),
          ),
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.only(
              topLeft: isMe == true ? const Radius.circular(30) : Radius.zero,
              topRight: isMe == true ? Radius.zero : const Radius.circular(30),
              bottomLeft: const Radius.circular(30),
              bottomRight: const Radius.circular(30),
            ),
            color: isMe == true ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
    );
  }
}
