import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocardo/core/model/study_set.dart';

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
}
