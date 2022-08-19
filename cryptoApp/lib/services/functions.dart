import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;

import '../utils/constans.dart';

class DataContract extends ChangeNotifier {
  late ContractAbi _abiCode;
  late EthereumAddress _contractAddress;
  late DeployedContract _deployedContract;
  late Web3Client _web3client;
  late EthPrivateKey _creds;
  late ContractFunction ethFunction;

  DataContract() {
    init();
  }

  Future<void> init() async {
    _web3client = Web3Client(
      PrivateKeys.rpcUrl,
      http.Client(),
    );
    loadContract();
    getCredentials();
  }

  Future<void> loadContract() async {
    String abi = await rootBundle.loadString('build/contracts/Election.json');
    var jsonABI = jsonDecode(abi);
    _abiCode = ContractAbi.fromJson(jsonEncode(jsonABI['abi']), 'Election');
    _contractAddress =
        EthereumAddress.fromHex(jsonABI['networks']["5777"]["address"]);
    _deployedContract = DeployedContract(_abiCode, _contractAddress);
  }

  Future<void> getCredentials() async {
    _creds = EthPrivateKey.fromHex(PrivateKeys.private_key);
  }

  Future<String> callFunction({
    required String funcName,
    required List<dynamic> args,
  }) async {
    ethFunction = _deployedContract.function(funcName);
    final result = await _web3client.sendTransaction(
      _creds,
      Transaction.callContract(
        contract: _deployedContract,
        function: ethFunction,
        parameters: args,
      ),
    );
    return result;
  }

  Future<String> startElection(String name) async {
    var response = await callFunction(funcName: 'startElection', args: [name]);
    return '';
  }
}
