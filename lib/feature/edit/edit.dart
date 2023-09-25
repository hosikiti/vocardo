import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/core/service/card/card_list_provider.dart';

class EditPage extends ConsumerStatefulWidget {
  const EditPage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditPageState();
}

class _EditPageState extends ConsumerState<EditPage> {
  final promptController = TextEditingController();
  final answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: promptController,
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
                onPressed: () {
                  if (promptController.text.isEmpty ||
                      answerController.text.isEmpty) return;

                  ref
                      .read(cardListProvider.notifier)
                      .add(promptController.text, answerController.text);
                  Navigator.pop(context);
                },
                child: const Text("Add"))
          ],
        ),
      ),
    );
  }
}
