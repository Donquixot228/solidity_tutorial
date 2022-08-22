import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidity_tutorial/cubits/silidity_logic_cubit.dart';
import 'package:solidity_tutorial/pages%20/home_page/home_page.dart';
import 'package:solidity_tutorial/services/functions.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'slider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SilidityLogicCubit(),
        ),
      ],
      child: MyApp(),
    ),
  );
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
      home: HomePage(),
    );
  }
}
