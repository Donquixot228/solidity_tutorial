part of 'silidity_logic_cubit.dart';

class SilidityLogicState {
  final String electionName;

  SilidityLogicState({required this.electionName});

  factory SilidityLogicState.initial() {
    return SilidityLogicState(
      electionName: '',
    );
  }

  SilidityLogicState copyWith({
    String? electionName,
  }) {
    return SilidityLogicState(
      electionName: electionName ?? this.electionName,
    );
  }
}
