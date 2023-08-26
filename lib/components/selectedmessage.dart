import 'package:flutter/material.dart';

class SelectedMessage extends StatelessWidget {
  final String message;

  const SelectedMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color(0xFF19A7D3),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}