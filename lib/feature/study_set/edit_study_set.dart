import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/core/model/study_set.dart';
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

    final futureLang = ref.read(currentTtsProvider.notifier).getLanguageList();
    final futureVoice = ref.read(currentTtsProvider.notifier).getVoiceList();
    final futureWait = Future.wait([futureLang, futureVoice]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: futureWait,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final langs = snapshot.data![0] as List<String>;
              final voices = snapshot.data![1] as List<Voice>;
              return _buildBody(set, langs, voices);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildBody(StudySet set, List<String> languages, List<Voice> voices) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text("Question Language:"),
      _buildLanguageSelect(languages, questionLanguage, (v) {
        setState(() {
          questionLanguage = v;
          questionVoice = null;
        });
      }),
      const SizedBox(height: 24),
      const Text("Question Voice:"),
      _buildVoiceSelect(voices, questionVoice, questionLanguage, (v) {
        setState(() {
          questionVoice = v;
        });
      }),
      const SizedBox(height: 24),
      const Text("Answer Language:"),
      _buildLanguageSelect(languages, answerLanguage, (v) {
        setState(() {
          answerLanguage = v;
          answerVoice = null;
        });
      }),
      const SizedBox(height: 24),
      const Text("Answer Voice:"),
      _buildVoiceSelect(voices, answerVoice, answerLanguage, (v) {
        setState(() {
          answerVoice = v;
        });
      }),
      const SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"))),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: FilledButton(
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
              child: const Text("Save"),
            ),
          )
        ],
      )
    ]);
  }

  Widget _buildLanguageSelect(
      List<String> languages, String? value, void Function(String?) onChanged) {
    final items = languages.map((lang) {
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

  Widget _buildVoiceSelect(List<Voice> voices, Voice? value,
      String? selectedLanguage, void Function(Voice?) onChanged) {
    final items = voices.where((voice) {
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
