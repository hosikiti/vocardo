import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocardo/core/model/study_set.dart';
import 'package:vocardo/core/service/card/card_service.dart';
import 'package:vocardo/core/util/text_util.dart';

part 'current_study_set_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentStudySet extends _$CurrentStudySet {
  @override
  StudySet build() {
    return StudySet();
  }

  void setStudySet(StudySet set) {
    state = set;
  }

  Future<void> importCsv(String text) async {
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
            studySet: state, question: question, answer: answer);
      }
    }
  }
}
