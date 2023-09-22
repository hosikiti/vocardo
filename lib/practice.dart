import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/provider.dart';

class PracticePage extends ConsumerStatefulWidget {
  const PracticePage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PracticePageState();
}

class _PracticePageState extends ConsumerState<PracticePage> {
  bool showAnswer = false;

  @override
  Widget build(BuildContext context) {
    final card = ref.watch(currentCardProvider);

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
              child: card.when(data: (card) {
                if (card == null) {
                  return const Text("No cards");
                }
                return Card(
                    child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Center(
                      child: Text(showAnswer ? card.answer : card.prompt,
                          style: Theme.of(context).textTheme.headlineLarge),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            showAnswer = !showAnswer;
                          });
                        },
                        icon: const Icon(Icons.replay)),
                  ],
                ));
              }, error: (_, __) {
                return const Text("Error");
              }, loading: () {
                return const Text("Loading");
              }),
            ),
            SizedBox(
              height: 64,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("HARD"),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(currentCardProvider.notifier).next();
                        setState(() {
                          showAnswer = false;
                        });
                      },
                      child: const Text("I KNOW"),
                    ),
                  )
                ],
              ),
            )
          ]),
        ));
  }
}
