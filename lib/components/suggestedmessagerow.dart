import 'package:flutter/material.dart';

class SuggestedMessageRow extends StatelessWidget {
  final List<Widget> messages;

  const SuggestedMessageRow({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: messages[index],
        );
      },
    );
  }
}