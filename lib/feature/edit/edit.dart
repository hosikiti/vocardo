import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/core/model/study_set.dart';
import 'package:vocardo/feature/card_list/card_list_provider.dart';
import 'package:vocardo/core/service/card/card_service.dart';
import 'package:vocardo/core/widget/toast_widget.dart';

class EditPage extends ConsumerStatefulWidget {
  final CardItem? initialItem;
  final StudySet studySet;
  const EditPage({
    Key? key,
    required this.studySet,
    this.initialItem,
  }) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditPageState();
}

class _EditPageState extends ConsumerState<EditPage> {
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();
  bool _isEdit = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // set initial item data
    if (widget.initialItem != null) {
      _questionController.text = widget.initialItem!.question;
      _answerController.text = widget.initialItem!.answer;
      _isEdit = true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? "Edit" : "Add"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _questionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a question";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Question (Front)',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _answerController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter an answer";
                  }
                  return null;
                },
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Answer (Back)',
                ),
              ),
              const SizedBox(height: 16),
              FilledButton(
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    await addOrUpdate(
                        _questionController.text, _answerController.text);

                    if (!context.mounted) {
                      return;
                    }
                    showToast(context, "Card ${_isEdit ? "updated" : "added"}");
                    Navigator.pop(context);
                  },
                  child: Text(_isEdit ? "Update" : "Add"))
            ],
          ),
        ),
      ),
    );
  }

  addOrUpdate(String question, String answer) async {
    final cards = ref.read(cardListProvider.notifier);
    if (widget.initialItem != null) {
      final CardItem card = CardItem(
        id: widget.initialItem!.id,
        question: question,
        answer: answer,
      );

      await cards.updateCard(card);
    } else {
      final cardService = await ref.read(cardServiceProvider.future);
      cardService.addCard(
          studySet: widget.studySet, question: question, answer: answer);
    }
  }
}
