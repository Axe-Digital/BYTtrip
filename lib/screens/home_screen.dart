import 'package:flutter/material.dart';
import 'package:chat/screens/login_screen.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF016684),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                ' Hello! \nI am Max',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: TextDecoration.none),
              ),
              Image.asset(
                'assets/bot.png',
                height: 200,
              ),
              const Text(
                'I am here to help you \nplan your trip.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              Builder(builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ConnectionPage()));
                  },
                  child: const Text('Get Started'),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mon application Flutter'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Bouton 1'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Bouton 2'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Bouton 3'),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Paramètres',
            ),
          ],
        ),
      ),
    );
  }
}
*/