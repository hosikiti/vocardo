import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/core/model/study_set.dart';
import 'package:vocardo/core/service/study_set/study_set_list_provider.dart';
import 'package:vocardo/core/widget/toast_widget.dart';

class AddStudySetDialog extends ConsumerStatefulWidget {
  const AddStudySetDialog({super.key});

  @override
  ConsumerState<AddStudySetDialog> createState() => AddStudySetDialogState();
}

class AddStudySetDialogState extends ConsumerState<AddStudySetDialog> {
  final TextEditingController _setName = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: _formKey,
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
              child: TextFormField(
                controller: _setName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a name";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Set name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FilledButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }

                  final studySets = ref.read(studySetListProvider.notifier);
                  final set = StudySet()..name = _setName.text;
                  studySets.addStudySet(set);
                  showToast(context, "Study set created!");
                  Navigator.of(context).pop();
                },
                child: const Text("Create"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
