import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidity_tutorial/cubits/silidity_logic_cubit.dart';

class ElectionInfo extends StatelessWidget {
  const ElectionInfo({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ElectionInfo());
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController addCandidateController = TextEditingController();
    TextEditingController authorizeVoterController = TextEditingController();
    return BlocBuilder<SilidityLogicCubit, SilidityLogicState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(state.electionName)),
          body: Container(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        FutureBuilder<List>(
                          future: context
                              .read<SilidityLogicCubit>()
                              .getCandidatesNum(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Text(
                              snapshot.data![0].toString(),
                              style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                        const Text('Total Candidates')
                      ],
                    ),
                    Column(
                      children: [
                        FutureBuilder<List>(
                            future: context
                                .read<SilidityLogicCubit>()
                                .getTotalVotes(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Text(
                                snapshot.data![0].toString(),
                                style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }),
                        const Text('Total Votes')
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: addCandidateController,
                        decoration: const InputDecoration(
                            hintText: 'Enter Candidate Name'),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<SilidityLogicCubit>()
                              .addCandidate(addCandidateController.text);
                        },
                        child: const Text('Add Candidate'))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: authorizeVoterController,
                        decoration: const InputDecoration(
                            hintText: 'Enter Voter address'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<SilidityLogicCubit>()
                            .authorizeVoter(authorizeVoterController.text);
                      },
                      child: const Text('Add Voter'),
                    ),
                  ],
                ),
                const Divider(),
                FutureBuilder<List>(
                  future: context.read<SilidityLogicCubit>().getCandidatesNum(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Column(
                        children: [
                          for (int i = 0; i < snapshot.data![0].toInt(); i++)
                            FutureBuilder<List>(
                              future: context
                                  .read<SilidityLogicCubit>()
                                  .candidateInfo(i),
                              builder: (context, candidatesnapshot) {
                                if (candidatesnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return ListTile(
                                    title: Text('Name: ' +
                                        candidatesnapshot.data![0][0]
                                            .toString()),
                                    subtitle: Text('Votes: ' +
                                        candidatesnapshot.data![0][1]
                                            .toString()),
                                    trailing: ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<SilidityLogicCubit>()
                                            .vote(i);
                                      },
                                      child: const Text('Vote'),
                                    ),
                                  );
                                }
                              },
                            ),
                        ],
                      );
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
