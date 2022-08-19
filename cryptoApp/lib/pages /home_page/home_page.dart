import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:solidity_tutorial/utils/constans.dart';
import 'package:web3dart/web3dart.dart';

import '../../services/notes_service.dart';

class HomePage extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Election'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                filled: true,
                hintText: 'Enter election name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Start Election'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
