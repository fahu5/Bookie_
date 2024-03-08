import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String senderName;
  final String messageContent;
  final String timestamp;
  final bool isCurrentUser; // Flag to identify sender

  const ChatMessage({
    Key? key,
    required this.senderName,
    required this.messageContent,
    required this.timestamp,
    required this.isCurrentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isCurrentUser)
          const CircleAvatar(
            // Display user profile picture if available
            backgroundImage: NetworkImage("https://placehold.it/150"),
          ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (!isCurrentUser)
                Text(
                  senderName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              Text(messageContent),
              Text(
                timestamp,
                style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
