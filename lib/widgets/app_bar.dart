import 'package:chat/screens/login_screen.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF016684),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: () {
          // Handle back button press
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ConnectionPage()));
        },
      ),
      title: const Row(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFF19A7D3),
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            'Max',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          color: Colors.white,
          onSelected: (value) {
            // Handle menu item selection here
            if (value == 'New page') {
            } else if (value == 'Delete chat') {
            } else if (value == 'Chat history') {
            } else if (value == 'confidentiality') {
              _handleMenuButtonPress(context);
            }
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem(
              value: 'New page',
              child: Text('New page'),
            ),
            const PopupMenuItem(
              value: 'Delete chat',
              child: Text('Delete chat'),
            ),
            const PopupMenuItem(
              value: 'Chat history',
              child: Text('Chat history'),
            ),
            const PopupMenuItem(
              value: 'confidentiality',
              child: Text('Confidentiality'),
            ),
          ],
        ),
      ],
    );
  }

  void _handleMenuButtonPress(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confidentiality'),
          content: const Text('Wait for it.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
