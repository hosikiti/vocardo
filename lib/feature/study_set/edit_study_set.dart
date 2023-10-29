import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/core/service/study_set/current_study_set_provider.dart';
import 'package:vocardo/core/service/study_set/study_set_list_provider.dart';
import 'package:vocardo/core/service/tts/tts_service.dart';

class EditStudySet extends ConsumerStatefulWidget {
  const EditStudySet({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditStudySetState();
}

class _EditStudySetState extends ConsumerState<EditStudySet> {
  String questionLanguage = "";
  Voice? questionVoice;

  @override
  void initState() {
    final set = ref.read(currentStudySetProvider);
    questionLanguage = set.questionLanguage;
    if (set.questionVoiceName.isNotEmpty &&
        set.questionVoiceLocale.isNotEmpty) {
      questionVoice = Voice(set.questionVoiceName, set.questionVoiceLocale);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final set = ref.watch(currentStudySetProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Question Language:"),
          _buildLanguageSelect(),
          const SizedBox(height: 16),
          const Text("Question Voice:"),
          _buildVoiceSelect(),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {
                if (questionVoice == null) {
                  return;
                }
                set.questionLanguage = questionLanguage;
                set.questionVoiceName = questionVoice!.name;
                set.questionVoiceLocale = questionVoice!.locale;
                ref.read(studySetListProvider.notifier).updateStudySet(set);
                Navigator.of(context).pop();
              },
              child: const Text("Save"))
        ]),
      ),
    );
  }

  Widget _buildLanguageSelect() {
    final future = ref.read(currentTtsProvider.notifier).getLanguageList();
    return FutureBuilder(
      future: future,
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!.map((lang) {
            return DropdownMenuItem(
              value: lang,
              child: Text(lang),
            );
          }).toList();
          return DropdownButton(
            items: items,
            value: questionLanguage.isEmpty ? null : questionLanguage,
            onChanged: (v) {
              final lang = v ?? "";
              setState(() {
                questionLanguage = lang;
              });
            },
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Widget _buildVoiceSelect() {
    final future = ref.read(currentTtsProvider.notifier).getVoiceList();
    return FutureBuilder(
      future: future,
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!.where((voice) {
            if (questionLanguage.isEmpty) {
              return true;
            }
            return voice.locale.startsWith(questionLanguage);
          }).map((voice) {
            return DropdownMenuItem(
              value: voice,
              child: Text("${voice.locale} - ${voice.name}"),
            );
          }).toList();
          return DropdownButton(
            items: items,
            value: questionVoice,
            onChanged: (v) {
              setState(() {
                questionVoice = v;
              });
            },
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
