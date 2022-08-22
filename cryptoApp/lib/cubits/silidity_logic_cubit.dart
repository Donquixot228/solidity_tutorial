import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

import '../utils/constans.dart';

part 'silidity_logic_state.dart';

class SilidityLogicCubit extends Cubit<SilidityLogicState> {
  SilidityLogicCubit() : super(SilidityLogicState.initial());
  // late ContractAbi _abiCode;
  // late EthereumAddress _contractAddress;
  // late DeployedContract _deployedContract;
  // late Web3Client _web3client;
  // late EthPrivateKey _creds;
  // late ContractFunction ethFunction;
  //
  // Future<void> init() async {
  //   _web3client = Web3Client(
  //     PrivateKeys.rpcUrl,
  //     http.Client(),
  //   );
  //   loadContract();
  //   log('ss');
  // }
  //
  // Future<void> loadContract() async {
  //   String abi = await rootBundle.loadString('build/contracts/Election.json');
  //   var jsonABI = jsonDecode(abi);
  //   _abiCode = ContractAbi.fromJson(jsonEncode(jsonABI['abi']), 'Election');
  //   _contractAddress =
  //       EthereumAddress.fromHex(jsonABI['networks']["5777"]["address"]);
  //   _deployedContract = DeployedContract(_abiCode, _contractAddress);
  //   log('ss');
  // }
  //
  // Future<void> getCredentials(String privateKey) async {
  //   _creds = EthPrivateKey.fromHex(privateKey);
  // }
  //
  // Future<String> callFunction({
  //   required String funcName,
  //   required List<dynamic> args,
  //   required String privateKey,
  // }) async {
  //   getCredentials(privateKey);
  //   final ethFunction = _deployedContract.function(funcName);
  //   final result = await _web3client.sendTransaction(
  //     _creds,
  //     Transaction.callContract(
  //       contract: _deployedContract,
  //       function: ethFunction,
  //       parameters: args,
  //     ),
  //     chainId: null,
  //     fetchChainIdFromNetworkId: true,
  //   );
  //   return result;
  // }
  //
  // Future<String> startElection(String name) async {
  //   emit(state.copyWith(electionName: name));
  //   var response = await callFunction(
  //     funcName: 'startElection',
  //     args: [name],
  //     privateKey: PrivateKeys.owner_private_key,
  //   );
  //   return response;
  // }
  //
  // Future<String> addCandidate(
  //   String name,
  // ) async {
  //   var response = await callFunction(
  //     funcName: 'addCandidate',
  //     args: [name],
  //     privateKey: PrivateKeys.owner_private_key,
  //   );
  //   log('Candidate added successfully');
  //   return response;
  // }
  //
  // Future<String> authorizeVoter(
  //   String address,
  // ) async {
  //   var response = await callFunction(
  //     funcName: 'authorizeVoter',
  //     args: [EthereumAddress.fromHex(address)],
  //     privateKey: PrivateKeys.owner_private_key,
  //   );
  //   log('Voter Authorized successfully');
  //   return response;
  // }
  //
  // Future<List<dynamic>> ask(
  //   String funcName,
  //   List<dynamic> args,
  // ) async {
  //   final ethFunction = _deployedContract.function(funcName);
  //   final result = _web3client.call(
  //     contract: _deployedContract,
  //     function: ethFunction,
  //     params: args,
  //   );
  //   return result;
  // }
  //
  // Future<List> getCandidatesNum() async {
  //   List<dynamic> result = await ask(
  //     'getNumCandidates',
  //     [],
  //   );
  //   return result;
  // }
  //
  // Future<List> getTotalVotes() async {
  //   List<dynamic> result = await ask(
  //     'getTotalVotes',
  //     [],
  //   );
  //   return result;
  // }
  //
  // Future<List> candidateInfo(
  //   int index,
  // ) async {
  //   List<dynamic> result = await ask(
  //     'candidateInfo',
  //     [BigInt.from(index)],
  //   );
  //   return result;
  // }
  //
  // Future<String> vote(
  //   int candidateIndex,
  // ) async {
  //   var response = await callFunction(
  //     funcName: "vote",
  //     args: [BigInt.from(candidateIndex)],
  //     privateKey: PrivateKeys.voter_private_key,
  //   );
  //   log("Vote counted successfully");
  //   return response;
  // }
}
