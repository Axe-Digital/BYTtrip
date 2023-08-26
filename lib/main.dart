import 'package:flutter/material.dart';
import 'package:chat/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Conversational agent for travel planning",
      home: HomePage(),
    );
  }
}

