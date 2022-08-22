import 'dart:developer';

import 'package:binance_chain/binance_chain.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:solidity_tutorial/cubits/silidity_logic_cubit.dart';
import 'package:solidity_tutorial/pages%20/electionInfo/electionInfo_page.dart';
import 'package:solidity_tutorial/utils/constans.dart';
import '../../services/notes_service.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  var testnetEnv;
  var httpClient;
   @override
   void initState() {
    // TODO: implement initState
      testnetEnv = BinanceEnvironment.getTestnetEnv();
      httpClient = HttpApiClient(env: testnetEnv);
     super.initState();
  }
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
              onChanged: (context) {
                log(controller.text);
              },
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
                onPressed: () {
                  // context
                  //     .read<SilidityLogicCubit>()
                  //     .startElection(controller.text);
                  //
                  // Navigator.push(context, ElectionInfo.route());
                },
                child: const Text('Start Election'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
