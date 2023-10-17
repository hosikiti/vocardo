import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/core/service/card/card_list_provider.dart';

class ImportPage extends ConsumerStatefulWidget {
  const ImportPage({Key? key}) : super(key: key);
  @override
  ConsumerState<ImportPage> createState() => _ImportPageState();
}

class _ImportPageState extends ConsumerState<ImportPage> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Import"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
            controller: _textController,
            minLines: 5,
            maxLines: null,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Paste CSV here',
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: "Import",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: "Cancel"),
        ],
        onTap: (value) {
          final text = _textController.text;
          if (value == 0) {
            final cardsService = ref.read(cardListProvider.notifier);

            for (var line in text.split("\n")) {
              final parts = line.split(",");
              if (parts.length == 2) {
                final question = parts[0];
                final answer = parts[1];
                if (question.isEmpty || answer.isEmpty) {
                  continue;
                }
                // cardsService.addCard(question, answer);
              }
            }
          }

          Navigator.pop(context);
        },
      ),
    );
  }
}
