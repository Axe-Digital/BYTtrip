import 'package:flutter/material.dart';

class SuggestedMessage extends StatelessWidget {
  final String message;

  const SuggestedMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          border: Border.all(color: const Color(0xFF19A7D3)),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ]),
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}