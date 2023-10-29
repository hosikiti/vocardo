// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_set.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStudySetCollection on Isar {
  IsarCollection<StudySet> get studySets => this.collection();
}

const StudySetSchema = CollectionSchema(
  name: r'StudySet',
  id: 2590383109450965943,
  properties: {
    r'answerLanguage': PropertySchema(
      id: 0,
      name: r'answerLanguage',
      type: IsarType.string,
    ),
    r'answerVoiceLocale': PropertySchema(
      id: 1,
      name: r'answerVoiceLocale',
      type: IsarType.string,
    ),
    r'answerVoiceName': PropertySchema(
      id: 2,
      name: r'answerVoiceName',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'questionLanguage': PropertySchema(
      id: 4,
      name: r'questionLanguage',
      type: IsarType.string,
    ),
    r'questionVoiceLocale': PropertySchema(
      id: 5,
      name: r'questionVoiceLocale',
      type: IsarType.string,
    ),
    r'questionVoiceName': PropertySchema(
      id: 6,
      name: r'questionVoiceName',
      type: IsarType.string,
    )
  },
  estimateSize: _studySetEstimateSize,
  serialize: _studySetSerialize,
  deserialize: _studySetDeserialize,
  deserializeProp: _studySetDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'items': LinkSchema(
      id: 4124715547297554163,
      name: r'items',
      target: r'Item',
      single: false,
      linkName: r'studySet',
    )
  },
  embeddedSchemas: {},
  getId: _studySetGetId,
  getLinks: _studySetGetLinks,
  attach: _studySetAttach,
  version: '3.1.0+1',
);

int _studySetEstimateSize(
  StudySet object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.answerLanguage.length * 3;
  bytesCount += 3 + object.answerVoiceLocale.length * 3;
  bytesCount += 3 + object.answerVoiceName.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.questionLanguage.length * 3;
  bytesCount += 3 + object.questionVoiceLocale.length * 3;
  bytesCount += 3 + object.questionVoiceName.length * 3;
  return bytesCount;
}

void _studySetSerialize(
  StudySet object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.answerLanguage);
  writer.writeString(offsets[1], object.answerVoiceLocale);
  writer.writeString(offsets[2], object.answerVoiceName);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.questionLanguage);
  writer.writeString(offsets[5], object.questionVoiceLocale);
  writer.writeString(offsets[6], object.questionVoiceName);
}

StudySet _studySetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StudySet();
  object.answerLanguage = reader.readString(offsets[0]);
  object.answerVoiceLocale = reader.readString(offsets[1]);
  object.answerVoiceName = reader.readString(offsets[2]);
  object.id = id;
  object.name = reader.readString(offsets[3]);
  object.questionLanguage = reader.readString(offsets[4]);
  object.questionVoiceLocale = reader.readString(offsets[5]);
  object.questionVoiceName = reader.readString(offsets[6]);
  return object;
}

P _studySetDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _studySetGetId(StudySet object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _studySetGetLinks(StudySet object) {
  return [object.items];
}

void _studySetAttach(IsarCollection<dynamic> col, Id id, StudySet object) {
  object.id = id;
  object.items.attach(col, col.isar.collection<Item>(), r'items', id);
}

extension StudySetQueryWhereSort on QueryBuilder<StudySet, StudySet, QWhere> {
  QueryBuilder<StudySet, StudySet, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StudySetQueryWhere on QueryBuilder<StudySet, StudySet, QWhereClause> {
  QueryBuilder<StudySet, StudySet, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StudySetQueryFilter
    on QueryBuilder<StudySet, StudySet, QFilterCondition> {
  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> answerLanguageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answerLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerLanguageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answerLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerLanguageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answerLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> answerLanguageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answerLanguage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerLanguageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'answerLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerLanguageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'answerLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerLanguageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'answerLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> answerLanguageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'answerLanguage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerLanguageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answerLanguage',
        value: '',
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerLanguageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'answerLanguage',
        value: '',
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceLocaleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answerVoiceLocale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceLocaleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answerVoiceLocale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceLocaleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answerVoiceLocale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceLocaleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answerVoiceLocale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceLocaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'answerVoiceLocale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceLocaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'answerVoiceLocale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceLocaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'answerVoiceLocale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceLocaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'answerVoiceLocale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceLocaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answerVoiceLocale',
        value: '',
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceLocaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'answerVoiceLocale',
        value: '',
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answerVoiceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answerVoiceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answerVoiceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answerVoiceName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'answerVoiceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'answerVoiceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'answerVoiceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'answerVoiceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answerVoiceName',
        value: '',
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      answerVoiceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'answerVoiceName',
        value: '',
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionLanguageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionLanguageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionLanguageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionLanguageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionLanguage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionLanguageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionLanguageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionLanguageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionLanguageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionLanguage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionLanguageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionLanguage',
        value: '',
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionLanguageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionLanguage',
        value: '',
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceLocaleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionVoiceLocale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceLocaleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionVoiceLocale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceLocaleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionVoiceLocale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceLocaleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionVoiceLocale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceLocaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionVoiceLocale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceLocaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionVoiceLocale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceLocaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionVoiceLocale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceLocaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionVoiceLocale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceLocaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionVoiceLocale',
        value: '',
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceLocaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionVoiceLocale',
        value: '',
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionVoiceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionVoiceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionVoiceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionVoiceName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionVoiceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionVoiceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionVoiceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionVoiceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionVoiceName',
        value: '',
      ));
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      questionVoiceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionVoiceName',
        value: '',
      ));
    });
  }
}

extension StudySetQueryObject
    on QueryBuilder<StudySet, StudySet, QFilterCondition> {}

extension StudySetQueryLinks
    on QueryBuilder<StudySet, StudySet, QFilterCondition> {
  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> items(
      FilterQuery<Item> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'items');
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> itemsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'items', length, true, length, true);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> itemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'items', 0, true, 0, true);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> itemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'items', 0, false, 999999, true);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> itemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'items', 0, true, length, include);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition>
      itemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'items', length, include, 999999, true);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterFilterCondition> itemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'items', lower, includeLower, upper, includeUpper);
    });
  }
}

extension StudySetQuerySortBy on QueryBuilder<StudySet, StudySet, QSortBy> {
  QueryBuilder<StudySet, StudySet, QAfterSortBy> sortByAnswerLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerLanguage', Sort.asc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> sortByAnswerLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerLanguage', Sort.desc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> sortByAnswerVoiceLocale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerVoiceLocale', Sort.asc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> sortByAnswerVoiceLocaleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerVoiceLocale', Sort.desc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> sortByAnswerVoiceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerVoiceName', Sort.asc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> sortByAnswerVoiceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerVoiceName', Sort.desc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> sortByQuestionLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionLanguage', Sort.asc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> sortByQuestionLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionLanguage', Sort.desc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> sortByQuestionVoiceLocale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionVoiceLocale', Sort.asc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy>
      sortByQuestionVoiceLocaleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionVoiceLocale', Sort.desc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> sortByQuestionVoiceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionVoiceName', Sort.asc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> sortByQuestionVoiceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionVoiceName', Sort.desc);
    });
  }
}

extension StudySetQuerySortThenBy
    on QueryBuilder<StudySet, StudySet, QSortThenBy> {
  QueryBuilder<StudySet, StudySet, QAfterSortBy> thenByAnswerLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerLanguage', Sort.asc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> thenByAnswerLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerLanguage', Sort.desc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> thenByAnswerVoiceLocale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerVoiceLocale', Sort.asc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> thenByAnswerVoiceLocaleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerVoiceLocale', Sort.desc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> thenByAnswerVoiceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerVoiceName', Sort.asc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> thenByAnswerVoiceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerVoiceName', Sort.desc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> thenByQuestionLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionLanguage', Sort.asc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> thenByQuestionLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionLanguage', Sort.desc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> thenByQuestionVoiceLocale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionVoiceLocale', Sort.asc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy>
      thenByQuestionVoiceLocaleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionVoiceLocale', Sort.desc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> thenByQuestionVoiceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionVoiceName', Sort.asc);
    });
  }

  QueryBuilder<StudySet, StudySet, QAfterSortBy> thenByQuestionVoiceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionVoiceName', Sort.desc);
    });
  }
}

extension StudySetQueryWhereDistinct
    on QueryBuilder<StudySet, StudySet, QDistinct> {
  QueryBuilder<StudySet, StudySet, QDistinct> distinctByAnswerLanguage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'answerLanguage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudySet, StudySet, QDistinct> distinctByAnswerVoiceLocale(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'answerVoiceLocale',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudySet, StudySet, QDistinct> distinctByAnswerVoiceName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'answerVoiceName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudySet, StudySet, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudySet, StudySet, QDistinct> distinctByQuestionLanguage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionLanguage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudySet, StudySet, QDistinct> distinctByQuestionVoiceLocale(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionVoiceLocale',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudySet, StudySet, QDistinct> distinctByQuestionVoiceName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionVoiceName',
          caseSensitive: caseSensitive);
    });
  }
}

extension StudySetQueryProperty
    on QueryBuilder<StudySet, StudySet, QQueryProperty> {
  QueryBuilder<StudySet, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StudySet, String, QQueryOperations> answerLanguageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answerLanguage');
    });
  }

  QueryBuilder<StudySet, String, QQueryOperations> answerVoiceLocaleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answerVoiceLocale');
    });
  }

  QueryBuilder<StudySet, String, QQueryOperations> answerVoiceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answerVoiceName');
    });
  }

  QueryBuilder<StudySet, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<StudySet, String, QQueryOperations> questionLanguageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionLanguage');
    });
  }

  QueryBuilder<StudySet, String, QQueryOperations>
      questionVoiceLocaleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionVoiceLocale');
    });
  }

  QueryBuilder<StudySet, String, QQueryOperations> questionVoiceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionVoiceName');
    });
  }
}
