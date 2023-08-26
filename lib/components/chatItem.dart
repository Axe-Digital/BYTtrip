import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:custom_clippers/custom_clippers.dart';

class ChatItem extends StatefulWidget {
  final List<dynamic>? list;
  final String? text;
  // final ? list1;
  // final List<dynamic>? list;
  // double i;
  final int index;
  final bool isMe;

  // final List<bool> buttonConfig;

  const ChatItem({
    super.key,
    required this.index,
    required this.isMe,
    this.text,
    this.list,
  });

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  // bool isOnePressed = false;
  // bool isPressed = false;
  // late int nbr;

  @override
  Widget build(BuildContext context) {
    // debugPrint(widget.buttonConfig.toString());
    // final height = MediaQuery.of(context).size.height;
    List<bool> boolList = List.generate(10, (index) => false);

    final width = MediaQuery.of(context).size.width;

    Widget multiButtons(List<bool> boolList) {
      List<Widget> buttons = [];
      print('taille');
      for (var element = 0;
          element < widget.list![widget.index].length;
          element++) {
        buttons.add(ElevatedButton(
          onPressed: () {
            if (!boolList.contains(true)) {
              setState(() {
                boolList[element] = true;
              });
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            shape: const RoundedRectangleBorder(
              // borderRadius: BorderRadius.circular(20),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(10),
              ),
              side: BorderSide(color: Colors.blue, width: 2),
            ),
            backgroundColor:
                boolList[element] ? Colors.blue[300] : Colors.white,
            maximumSize: Size(width * 0.60, double.infinity),
          ),
          child: Text(
            widget.list![widget.index][element].toString(),
            style: boolList[element]
                ? const TextStyle(color: Colors.white)
                : const TextStyle(color: Colors.black),
          ),
        ));
      }

      return Column(children: buttons);
    }

    Widget left() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsetsDirectional.symmetric(
                    vertical: 20, horizontal: 10),
                margin: const EdgeInsets.only(left: 20, top: 20),
                constraints: BoxConstraints(
                  maxWidth: width * 0.60,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF016684),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Text(
                  widget.text!,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50)),
                    width: 40,
                    height: 40,
                    child: Image.asset("assets/bot.png"),
                  ))
            ],
          )
        ],
      );
    }

    Widget right() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          multiButtons(boolList),
        ],
      );
    }

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: widget.isMe ? right() : left());
  }
}
