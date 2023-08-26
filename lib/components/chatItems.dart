import 'package:flutter/material.dart';
import 'package:chat/components/chatItem.dart';

class ChatItems extends StatelessWidget {
  final List<dynamic> list;
  final int index;
  final String text;

  const ChatItems(
      {super.key,
      required this.list,
      required this.index, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ChatItem(
        index: index,
        text: text,
        isMe: false,
      ),
      ChatItem(
        isMe: true,
        index: index,
        list: list,
      ),
    ]);
  }
}
