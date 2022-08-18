import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solidity_tutorial/pages%20/home_page/home_page.dart';
import 'package:solidity_tutorial/services/notes_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NotesService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'solidity tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
