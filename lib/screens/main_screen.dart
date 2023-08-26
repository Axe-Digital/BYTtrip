import 'package:chat/components/chatItems.dart';
// import 'package:chat/providers/chat_providers.dart';
import 'package:chat/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:chat/database/sql_helper.dart';
import 'package:chat/database/sql.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:chat/database/a.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, dynamic>> questions = [];
  List<Map<String, dynamic>> responses = [];

  Future<void> getQuestions(String table) async {
    final data = await SQLHelper.getItems(table);
    setState(() {
      questions = data;
    });
    debugPrint("ok donc 2 $data");
  }

  Future<void> addData() async {
    final db = await SQLHelper.db();
    await insert(db);
  }

  void ajoute() async {}

  void close2() async {
    final db = await SQLHelper.db();
    close(db);
  }

  @override
  void initState() {
    super.initState();
    addData();
    getQuestions('agence');
    getQuestions('hotel');
    getQuestions('questions');

    debugPrint("essseu ca marche ${questions.toString()}");
  }

  @override
  void dispose() {
    close2();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // getQuestions(chats);

    List<bool> boolList = List.generate(9, (index) => false);
    List<dynamic> list = [
      [
        {'Voyage Affaire', 'Voyage Sejour'}
      ],
      [
        {'Doula', 'Yaounde', 'Edea', 'Bafoussam', 'Kribi'}
      ],
      [
        {'Doula', 'Yaounde', 'Edea', 'Bafoussam', 'Kribi'}
      ],
      [
        {'Bus', 'Train'}
      ],
      [
        {
          'Amour Mezam',
          'Buca Voyage',
          'Etoile Star',
          'Finex Voyage',
          'General Express',
          'Global Voyage',
          'Musango Voyage',
          'Princesse Voyage',
          'Real Express',
          'Touristique Express',
          'Trans-Cam',
          'Trans-Ouest'
        }
      ]
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: const MyAppBar(),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              reverse: false,
              itemCount: 7,
              itemBuilder: (context, index) => ChatItems(
                  text: questions[index]['content'], list: list, index: index)),
        ),
      ]),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    super.key,
  });

  final TextEditingController textEditingTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      elevation: 0.0,
      color: Colors.white,

      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 10,
          right: 10),
      // shadowColor: Colors.blue,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF016684),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextField(
                controller: textEditingTextField,
                style: const TextStyle(color: Colors.white),
                maxLines: null,
                decoration: const InputDecoration(
                  hintStyle:
                      TextStyle(color: Color.fromARGB(78, 255, 255, 255)),
                  hintText: 'Envoyer un feedback',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              color: Colors.blue,
              onPressed: () => textEditingTextField.clear(),
            ),
          ],
        ),
      ),
    );
  }
}
