import 'package:flutter/material.dart';
import 'package:custom_clippers/custom_clippers.dart';

final Map<dynamic, dynamic> mesDonnees = {
  "o": "dhhada",
  "question": [
    {
      "1":
          "Quel type de voyage souhaitez-vous effectuer ?",
      "2": "Quel est votre ville de depart ?",
      "3": "Dans quelle ville desirez-vous aller ?"
    },
    {
      "1": "Quel type de voyage souhaitez-vous effectuer ?",
      "2": "Quel est votre ville de depart ?",
      "3": "Dans quelle ville desirez-vous aller d?"
    }
  ]
};

bool a = true;

class ChatMessage extends StatefulWidget {
  const ChatMessage({super.key});

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  late String message;
  late bool isBot;

  @override
  Widget build(BuildContext context) {
/*    return Column(children: [
      for (int i = 0; i < 2; i++) ...[
        ...mesDonnees.entries.map((entry) {
          return textMessage(
            entry.value,
            true,
          );
        }).toList(),
        if (a == false) textMessage("entry.value", false),
      ],
    ]);
*/
    return Column(children: [
      for (int i = 0; i < 2; i++) ...[
        ...mesDonnees.entries.map((entry) {
          return textMessage(
            entry.value,
            true,
          );
        }).toList(),
        setTextMessage("arg1"),
        if (a == false) textMessage("entry.value", false),
      ],
    ]);
  }

  Widget textMessage(String message, bool isBot) {
    if (isBot) {
      return Container(
          padding:
              const EdgeInsets.only(top: 20, left: 0, right: 200, bottom: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            GestureDetector(
              onTap: () async => question(message),
              child: Padding(
                padding: const EdgeInsets.only(right: 80),
                child: ClipPath(
                  clipper: UpperNipMessageClipper(
                    MessageType.receive,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(color: Colors.amber),
                    child: Text(
                      message,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ),
            )
          ]));
    }
    return Container(
      padding: const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 80),
              child: ClipPath(
                clipper: LowerNipMessageClipper(MessageType.send),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 20, top: 5, bottom: 50, right: 20),
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                  ),
                  child: Text(
                    message,
                    style:
                        const TextStyle(fontSize: 14.0, color: Colors.black26),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> question(String message) async {
    setState(() {
      a = false;
    });
    debugPrint("hey");

    // requete a la base de donnees
  }

  Widget setTextMessage(String arg1, [dynamic arguments]) {
    return Column(children: [
      textMessage(arg1, true),
      if (arguments != null)
        for (String element in arguments) ...[textMessage(element, true)]
    ]);
  }
}
