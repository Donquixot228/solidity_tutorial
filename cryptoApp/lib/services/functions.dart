import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';

class DataContract extends ChangeNotifier{
  late ContractAbi _abiCode;
  late EthereumAddress _contractAddress;
  late DeployedContract _deployedContract;

  Future<void> loadContract() async {
    String abi = await rootBundle.loadString('build/contracts/Election.json');
    var jsonABI = jsonDecode(abi);
    _abiCode = ContractAbi.fromJson(jsonEncode(jsonABI['abi']), 'Election');
    _contractAddress =
        EthereumAddress.fromHex(jsonABI['networks']["5777"]["address"]);
    _deployedContract = DeployedContract(_abiCode, _contractAddress);
  }
}
