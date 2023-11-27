import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/core/service/card/card_service.dart';
import 'package:vocardo/core/service/study_set/current_study_set_provider.dart';
import 'package:vocardo/core/util/text_util.dart';

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
        onTap: (value) async {
          final text = _textController.text;
          if (value == 0) {
            // Import button is pressed
            final studySet = ref.read(currentStudySetProvider);
            final cardService = await ref.read(cardServiceProvider.future);

            for (final line in text.split("\n")) {
              final parts = line.split(",");
              if (parts.length == 2) {
                final question = unquote(parts[0]);
                final answer = unquote(parts[1]);
                if (question.isEmpty || answer.isEmpty) {
                  continue;
                }
                cardService.addCard(
                    studySet: studySet, question: question, answer: answer);
              }
            }
            if (mounted) {
              Navigator.of(context).pop();
            }
          }
        },
      ),
    );
  }
}
