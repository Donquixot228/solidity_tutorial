import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/notes_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white24,
      body: Center(
        child: Text('Initial view in binance api',style: TextStyle(color: Colors.white,fontSize: 30),),
      ),
    );
  }
}
