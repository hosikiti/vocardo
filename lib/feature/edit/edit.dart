import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/core/model/item.dart';
import 'package:vocardo/core/service/card/card_list_provider.dart';
import 'package:vocardo/core/service/card/card_service.dart';

class EditPage extends ConsumerStatefulWidget {
  final CardItem? initialItem;
  const EditPage({
    Key? key,
    this.initialItem,
  }) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditPageState();
}

class _EditPageState extends ConsumerState<EditPage> {
  final questionController = TextEditingController();
  final answerController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    // set initial item data
    if (widget.initialItem != null) {
      questionController.text = widget.initialItem!.question;
      answerController.text = widget.initialItem!.answer;
      isEdit = true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit" : "Add"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: questionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Card title',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: answerController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Card description',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () async {
                  if (questionController.text.isEmpty ||
                      answerController.text.isEmpty) return;
                  await addOrUpdate(
                      questionController.text, answerController.text);
                  if (!mounted) {
                    return;
                  }
                  Navigator.pop(context);
                },
                child: Text(isEdit ? "Update" : "Add"))
          ],
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

      cards.updateCard(card);
    } else {
      cards.addCard(question, answer);
    }
  }
}
