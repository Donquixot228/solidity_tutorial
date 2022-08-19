import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solidity_tutorial/pages%20/home_page/home_page.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'slider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solidity',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
          ),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}
