import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/core/model/study_set.dart';
import 'package:vocardo/core/service/study_set/study_set_list_provider.dart';

class AddStudySetDialog extends ConsumerStatefulWidget {
  const AddStudySetDialog({super.key});

  @override
  ConsumerState<AddStudySetDialog> createState() => AddStudySetDialogState();
}

class AddStudySetDialogState extends ConsumerState<AddStudySetDialog> {
  final TextEditingController _setName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Create a new set"),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _setName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Set name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                final studySets = ref.read(studySetListProvider.notifier);
                final set = StudySet()..name = _setName.text;
                studySets.addStudySet(set);
                Navigator.of(context).pop();
              },
              child: const Text("Create"),
            ),
          )
        ],
      ),
    );
  }
}
