import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/core/model/study_set.dart';
import 'package:vocardo/feature/study_set/provider/current_study_set_provider.dart';
import 'package:vocardo/feature/study_set/provider/study_set_list_provider.dart';
import 'package:vocardo/core/util/text_util.dart';
import 'package:vocardo/feature/card_list/card_list.dart';
import 'package:vocardo/feature/edit/edit.dart';
import 'package:vocardo/feature/practice/practice.dart';
import 'package:vocardo/feature/study_set/edit_study_set.dart';

class StudySetListPage extends ConsumerWidget {
  const StudySetListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(studySetListProvider);

    return data.when(data: (sets) {
      if (sets.isEmpty) {
        return Center(
          child: FilledButton.icon(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EditStudySet(),
              ));
            },
            label: const Text("CREATE A NEW SET"),
            icon: const Icon(Icons.add),
          ),
        );
      }

      return ListView.builder(
        itemBuilder: (context, index) {
          final set = sets[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                ref.read(currentStudySetProvider.notifier).setStudySet(set);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CardListPage(),
                ));
              },
              child: StudySetCard(set: set),
            ),
          );
        },
        itemCount: sets.length,
      );
    }, error: (error, stackTrace) {
      return Center(
        child: Text("failed to load data: $error"),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

class StudySetCard extends ConsumerWidget {
  const StudySetCard({
    super.key,
    required this.set,
  });

  final StudySet set;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(set.name, style: theme.textTheme.headlineLarge),
              const SizedBox(height: 16),
              Text(
                  "${set.getNeedsReviewCount()} / ${set.items.length} ${unitText(set.items.length, "card", "cards")} need practice"),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilledButton.icon(
                    onPressed: set.items.isNotEmpty
                        ? () {
                            ref
                                .read(currentStudySetProvider.notifier)
                                .setStudySet(set);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const PracticePage(),
                              ),
                            );
                          }
                        : null,
                    label: const Text(
                      "PRACTICE",
                    ),
                    icon: const Icon(Icons.play_arrow),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditPage(
                          studySet: set,
                        ),
                      ));
                    },
                    label: const Text(
                      "ADD",
                    ),
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
