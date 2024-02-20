import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/feature/study_set/provider/current_study_set_provider.dart';

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
            final studySet = ref.read(currentStudySetProvider.notifier);
            await studySet.importCsv(text);
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          }
        },
      ),
    );
  }
}
