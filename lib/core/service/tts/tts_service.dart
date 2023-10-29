import 'package:flutter_tts/flutter_tts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocardo/core/service/study_set/current_study_set_provider.dart';

part 'tts_service.g.dart';

class Voice {
  final String name;
  final String locale;

  Voice(this.name, this.locale);

  @override
  bool operator ==(Object other) {
    return other is Voice && name == other.name;
  }

  @override
  int get hashCode {
    return name.hashCode;
  }
}

@Riverpod(keepAlive: true)
class CurrentTts extends _$CurrentTts {
  @override
  FlutterTts build() {
    final tts = FlutterTts();
    return tts;
  }

  Future<void> speakQuestion(String text) async {
    final set = ref.read(currentStudySetProvider);
    if (set.questionLanguage.isEmpty ||
        set.questionVoiceName.isEmpty ||
        set.questionVoiceLocale.isEmpty) {
      return;
    }
    await state.setLanguage(set.questionLanguage);
    await state.setVoice({
      "name": set.questionVoiceName,
      "locale": set.questionVoiceLocale,
    });

    await state.speak(text);
  }

  Future<void> speakAnswer(String text) async {
    final set = ref.read(currentStudySetProvider);
    if (set.answerLanguage.isEmpty ||
        set.answerVoiceName.isEmpty ||
        set.answerVoiceLocale.isEmpty) {
      return;
    }
    await state.setLanguage(set.answerLanguage);
    await state.setVoice({
      "name": set.answerVoiceName,
      "locale": set.answerVoiceLocale,
    });

    await state.speak(text);
  }

  Future<List<Voice>> getVoiceList() async {
    final voices = await state.getVoices as List<dynamic>;
    return voices.map((e) => Voice(e["name"]!, e["locale"]!)).toList()
      ..sort((a, b) => a.name.compareTo(b.name));
  }

  Future<List<String>> getLanguageList() async {
    final languages = await state.getLanguages as List<dynamic>;
    return languages.map((e) => e.toString()).toList()
      ..sort(
        (a, b) => a.compareTo(b),
      );
  }
}
