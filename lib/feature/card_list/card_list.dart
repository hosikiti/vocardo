import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/feature/card_list/provider/card_list_provider.dart';
import 'package:vocardo/feature/study_set/provider/current_study_set_provider.dart';
import 'package:vocardo/feature/study_set/provider/study_set_list_provider.dart';
import 'package:vocardo/core/service/tts/tts_service.dart';
import 'package:vocardo/core/util/text_util.dart';
import 'package:vocardo/core/util/time_util.dart';
import 'package:vocardo/core/widget/dialog_widget.dart';
import 'package:vocardo/feature/edit/edit.dart';
import 'package:vocardo/feature/import/import.dart';
import 'package:vocardo/feature/practice/practice.dart';
import 'package:vocardo/feature/study_set/edit_study_set.dart';

class CardListPage extends ConsumerStatefulWidget {
  const CardListPage({super.key});
  @override
  ConsumerState<CardListPage> createState() => _CardListPageState();
}

class _CardListPageState extends ConsumerState<CardListPage> {
  @override
  Widget build(BuildContext context) {
    final cardsRef = ref.watch(cardListProvider);
    final noCard =
        cardsRef.valueOrNull == null || cardsRef.valueOrNull!.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            final cardsRef = ref.watch(cardListProvider);
            const noCards = Text("No cards yet!");
            return cardsRef.when(
                data: (cards) => cards.isNotEmpty
                    ? Text(
                        "${cards.length} ${unitText(cards.length, "card", "cards")}")
                    : noCards,
                error: (_, __) => noCards,
                loading: () => const CircularProgressIndicator());
          },
        ),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: "edit",
                  child: const Text("Edit"),
                  onTap: () {
                    final set = ref.read(currentStudySetProvider);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditStudySet(
                        initialData: set,
                      ),
                    ));
                  },
                ),
                PopupMenuItem(
                  value: "import",
                  child: const Text("Import CSV"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ImportPage()));
                  },
                ),
                PopupMenuItem(
                  value: "Delete This Set",
                  child: const Text("Delete This Set",
                      style: TextStyle(color: Colors.red)),
                  onTap: () async {
                    final yes = await showOkCancelDialog(context,
                        content: "Are you sure?", title: "Delete");
                    if (!yes) return;
                    final set = ref.read(currentStudySetProvider);
                    final studySetProvider =
                        ref.read(studySetListProvider.notifier);
                    studySetProvider.deleteStudySet(set.id);
                    if (!context.mounted) {
                      return;
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ];
            },
          )
        ],
      ),
      body: cardsRef.when(
        data: (cards) {
          if (cards.isEmpty) {
            return Center(
              child: FilledButton.icon(
                onPressed: () {
                  final set = ref.read(currentStudySetProvider);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditPage(studySet: set)));
                },
                label: const Text("ADD A NEW CARD"),
                icon: const Icon(Icons.add),
              ),
            );
          }

          return _buildCardList(cards);
        },
        error: (_, __) {
          return const Text("Error");
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: "add",
                onPressed: () {
                  final set = ref.read(currentStudySetProvider);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditPage(studySet: set)));
                },
                tooltip: 'Add a new card',
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 16),
              FloatingActionButton(
                heroTag: "practice",
                onPressed: noCard
                    ? null
                    : () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PracticePage()));
                      },
                disabledElevation: noCard ? 0 : 6,
                foregroundColor: noCard ? Colors.grey : null,
                tooltip: 'Practice',
                child: const Icon(Icons.play_arrow),
              ),
            ]),
      ),
    );
  }

  Widget _buildCardList(List<CardItem> cards) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final card = cards[index];
        return InkWell(
          onTap: () {
            final studySet = ref.read(currentStudySetProvider);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  EditPage(studySet: studySet, initialItem: card),
            ));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StudyCard(card: card),
          ),
        );
      },
      itemCount: cards.length,
    );
  }
}

class StudyCard extends ConsumerWidget {
  const StudyCard({
    super.key,
    required this.card,
  });

  final CardItem card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 8,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.circle,
                color: Theme.of(context).colorScheme.shadow,
              )
            ]),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(
                    card.question,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  subtitle: Text(card.answer),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                        (card.reviewAfter != null
                            ? "Review in ${whenIsIt(card.reviewAfter!)}"
                            : ""),
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () async {
                        await ref
                            .read(currentTtsProvider.notifier)
                            .speakQuestion(card.question);
                        await ref
                            .read(currentTtsProvider.notifier)
                            .speakAnswer(card.answer);
                      },
                      icon: const Icon(Icons.volume_up),
                    ),
                    PopupMenuButton<String>(
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            value: "delete",
                            child: const Text("Delete"),
                            onTap: () async {
                              final yes = await showOkCancelDialog(context,
                                  title: "Delete", content: "Are you sure?");
                              if (!yes) return;

                              await ref
                                  .read(cardListProvider.notifier)
                                  .deleteCard(card);
                            },
                          ),
                        ];
                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
