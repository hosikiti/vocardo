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
  String? questionLanguage;
  Voice? questionVoice;
  String? answerLanguage;
  Voice? answerVoice;

  @override
  void initState() {
    final set = ref.read(currentStudySetProvider);
    questionLanguage = set.questionLanguage;
    if (set.questionVoiceName.isNotEmpty &&
        set.questionVoiceLocale.isNotEmpty) {
      questionVoice = Voice(set.questionVoiceName, set.questionVoiceLocale);
    }
    answerLanguage = set.answerLanguage;
    if (set.answerVoiceName.isNotEmpty && set.answerVoiceLocale.isNotEmpty) {
      answerVoice = Voice(set.answerVoiceName, set.answerVoiceLocale);
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
          _buildLanguageSelect(questionLanguage, (v) {
            setState(() {
              questionLanguage = v;
              questionVoice = null;
            });
          }),
          const SizedBox(height: 16),
          const Text("Question Voice:"),
          _buildVoiceSelect(questionVoice, questionLanguage, (v) {
            setState(() {
              questionVoice = v;
            });
          }),
          const SizedBox(height: 16),
          const Text("Answer Language:"),
          _buildLanguageSelect(answerLanguage, (v) {
            setState(() {
              answerLanguage = v;
            });
          }),
          const SizedBox(height: 16),
          const Text("Answer Voice:"),
          _buildVoiceSelect(answerVoice, answerLanguage, (v) {
            setState(() {
              answerVoice = v;
            });
          }),
          ElevatedButton(
              onPressed: isValid()
                  ? () {
                      set.questionLanguage = questionLanguage!;
                      set.questionVoiceName = questionVoice!.name;
                      set.questionVoiceLocale = questionVoice!.locale;
                      set.answerLanguage = answerLanguage!;
                      set.answerVoiceName = answerVoice!.name;
                      set.answerVoiceLocale = answerVoice!.locale;
                      ref
                          .read(studySetListProvider.notifier)
                          .updateStudySet(set);
                      Navigator.of(context).pop();
                    }
                  : null,
              child: const Text("Save"))
        ]),
      ),
    );
  }

  Widget _buildLanguageSelect(String? value, void Function(String?) onChanged) {
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
            value: value,
            onChanged: onChanged,
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Widget _buildVoiceSelect(
      Voice? value, String? selectedLanguage, void Function(Voice?) onChanged) {
    final future = ref.read(currentTtsProvider.notifier).getVoiceList();
    return FutureBuilder(
      future: future,
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!.where((voice) {
            if (selectedLanguage == null) {
              return true;
            }
            return voice.locale.startsWith(selectedLanguage);
          }).map((voice) {
            return DropdownMenuItem(
              value: voice,
              child: Text("${voice.locale} - ${voice.name}"),
            );
          }).toList();

          return DropdownButton(
            items: items,
            value: value,
            onChanged: onChanged,
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  bool isValid() {
    if (questionLanguage == null ||
        questionVoice == null ||
        answerLanguage == null ||
        answerVoice == null) {
      return false;
    }
    return true;
  }
}
